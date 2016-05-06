//
//  MasterViewController.swift
//  TinyPix
//
//  Created by  wj on 16/1/22.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    @IBOutlet var colorControl:UISegmentedControl!
    private var documentFileNames:[String] = []
    private var chosenDocument:TinyPixDocument?
    private var query:NSMetadataQuery!
    private var documentURLs:[NSURL] = []
    var files:[String]?
    var attr1 :[String : AnyObject]?
    var attr2 :[String : AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "inserNewObject")
        navigationItem.rightBarButtonItem = addButton
        
        let prefs = NSUserDefaults.standardUserDefaults()
        let selectedColorIndex = prefs.integerForKey("selectedacolorIndex")
        print(selectedColorIndex)
        setTintColorForIndex(selectedColorIndex)
        colorControl.selectedSegmentIndex = selectedColorIndex
        
        reloadFiles()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onSettingChanged:", name: NSUserDefaultsDidChangeNotification, object: nil)
        
    }
    func onSettingChanged(notification:NSNotification){
        let prefs = NSUserDefaults.standardUserDefaults()
        let selectedacolorIndex = prefs.integerForKey("selectedacolorIndex")
        setTintColorForIndex(selectedacolorIndex)
        colorControl.selectedSegmentIndex = selectedacolorIndex
    }
    
    private func urlForFileName(fileName:String) -> NSURL{
        let fm = NSFileManager.defaultManager()
        let baseURL = fm.URLForUbiquityContainerIdentifier(nil)
        let pathURL = baseURL?.URLByAppendingPathComponent("Documents")
        let destinationURL = pathURL?.URLByAppendingPathComponent(fileName)
        return destinationURL!
    }
    private func reloadFiles(){
        let fileManager = NSFileManager.defaultManager()
        
        let cloudURL = fileManager.URLForUbiquityContainerIdentifier(nil)
        print("得到cloud URL\(cloudURL)")
        if cloudURL != nil{
            query = NSMetadataQuery()
            query.predicate = NSPredicate(format: "%K like '*.tinypix'", NSMetadataItemFSNameKey)
            query.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUbiquitousDocuments:", name: NSMetadataQueryDidFinishGatheringNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUbiquitousDocuments:", name: NSMetadataQueryDidUpdateNotification, object: nil)
            
            query.startQuery()
        }
    }
    
    func updateUbiquitousDocuments(notification:NSNotification){
        documentURLs = []
        documentFileNames = []
        
        print("updateUbiquitousDocuments, 查询结果 = \(query.results)")
        let results = query.results.sort { (obj1, obj2) -> Bool in
            let item1 = obj1 as! NSMetadataItem
            let item2 = obj2 as! NSMetadataItem
            let item1Data = item1.valueForAttribute(NSMetadataItemFSCreationDateKey) as! NSDate
            let item2Data = item2.valueForAttribute(NSMetadataItemFSCreationDateKey) as! NSDate
            let result = item1Data.compare(item2Data)
            return result == NSComparisonResult.OrderedAscending
        }
        for item in results as! [NSMetadataItem]{
            let url = item.valueForAttribute(NSMetadataItemURLKey) as! NSURL
            documentURLs.append(url)
            documentFileNames.append(url.lastPathComponent!)
        }
        tableView.reloadData()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileNames.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FileCell")! as UITableViewCell
        let path = documentFileNames[indexPath.row] as NSString
        cell.textLabel?.text = (path.lastPathComponent as NSString).stringByDeletingPathExtension
        return cell
    }
    @IBAction func chooseColor(sender:UISegmentedControl){
        let selectedacolorIndex = sender.selectedSegmentIndex
        setTintColorForIndex(selectedacolorIndex)
        
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setInteger(selectedacolorIndex, forKey: "selectedacolorIndex")
        prefs.synchronize()
        
        NSUbiquitousKeyValueStore.defaultStore().setLongLong(Int64(selectedacolorIndex), forKey: "selectedColorIndex")
        NSUbiquitousKeyValueStore.defaultStore().synchronize()
    }
    
    private func setTintColorForIndex(colorIndex:Int){
        colorControl.tintColor = TinyPixUtils.getTintColorForIndex(colorIndex)
    }
    
    func inserNewObject(){
        let alert = UIAlertController(title: "Choose File Name", message: "Enter a name for your new TinyPixdocument", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let createAction = UIAlertAction(title: "创建", style: .Default) { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            self.createFileNamed(textField.text!)
            
        }
        alert.addAction(cancelAction)
        alert.addAction(createAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    private func createFileNamed(fileName:String){
        let trimmedFileName = fileName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if trimmedFileName.isEmpty == false{
            let targetName = trimmedFileName + ".tinypix"
            let saveUrl = urlForFileName(targetName)
            print(saveUrl)
            chosenDocument = TinyPixDocument(fileURL: saveUrl)
            chosenDocument?.saveToURL(saveUrl, forSaveOperation: .ForCreating, completionHandler: { (success) -> Void in
                if success {
                    print("保存成功")
                    self.reloadFiles()
                    self.performSegueWithIdentifier("masterToDetail", sender: self)
                }else{
                    print("保存失败")
                }
            })
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! UINavigationController
        let detailVC = destination.topViewController as! DetailViewController
        
        if sender === self{
            detailVC.detailItem = chosenDocument
        }else{
            let indexPath = tableView.indexPathForSelectedRow!
            let filename = documentFileNames[indexPath.row]
            let docURL = urlForFileName(filename)
            chosenDocument = TinyPixDocument(fileURL: docURL)
            chosenDocument?.openWithCompletionHandler({ (success) -> Void in
                if success{
                    print("加载成功")
                    detailVC.detailItem = self.chosenDocument
                }else{
                    print("加载失败")
                }
            })
        }
    }
  }

