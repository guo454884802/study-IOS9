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
    }
    private func urlForFileName(fileName:String) -> NSURL{
        let fm = NSFileManager.defaultManager()
        let urls = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let directoryURL = urls[0]
        let fileURL = directoryURL.URLByAppendingPathComponent(fileName)
        return fileURL
    }
    private func reloadFiles(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        let path = paths[0]
        let fm = NSFileManager.defaultManager()
        
        do{
            files = try fm.contentsOfDirectoryAtPath(path)
            
        }catch{
            print(error)
        }
        if files != nil{
            let sortedFileNames = files?.sort({ (fileName1, fileName2) -> Bool in
                let file1Path = (path as NSString).stringByAppendingPathComponent(fileName1)
                print(file1Path)
                let file2Path = (path as NSString).stringByAppendingPathComponent(fileName2)
                do{
                    attr1 = try fm.attributesOfItemAtPath(file1Path)
                }catch{
                    print(error)
                }
                do{
                    attr2 = try fm.attributesOfItemAtPath(file2Path)
                }catch{
                    print(error)
                }
                let file1Date = attr1![NSFileCreationDate] as! NSDate
                let file2Date = attr2![NSFileCreationDate] as! NSDate
                let result = file1Date.compare(file2Date)
                return result == NSComparisonResult.OrderedAscending
            })
            documentFileNames = sortedFileNames!
            tableView.reloadData()
        }else{
            print("Error listing files in directory \(path)")
        }
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
        print("改变了偏好设置")
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

