//
//  playListTableViewController.swift
//  videoPlayer
//
//  Created by  wj on 15/11/21.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class playListTableViewController: UITableViewController {

    @IBOutlet weak var itemButton: UIBarButtonItem!
    var name = ["冰与火之歌","权力的游戏","声纳图像","夏洛特烦恼","饥饿游戏"]
    var time = ["2015.11.21","2015.11.22","2015.11.23","2015.11.24","2015.11.25"]
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
       
        let urlStr = NSBundle.mainBundle().pathForResource("11", ofType: "mp4")
        let url = NSURL.fileURLWithPath(urlStr!)
        let asset = AVURLAsset(URL: url)
        let generatel = AVAssetImageGenerator(asset: asset)
        generatel.appliesPreferredTrackTransform = true
        let time = CMTimeMake(1, 2)
        do{
            let oneRef = try generatel.copyCGImageAtTime(time, actualTime: nil)
            image = UIImage(CGImage: oneRef)
        }catch{
            print(error)
        }
        //let urlStr = NSBundle.mainBundle().pathForResource("11", ofType: "mp4")
//        let url = NSURL.fileURLWithPath(urlStr!)
//        let play1 = MPMoviePlayerViewController(contentURL: url)
//        play1?.moviePlayer.requestThumbnailImagesAtTimes([1.0], timeOption: .NearestKeyFrame)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "thumImageGet:", name: MPMoviePlayerThumbnailImageRequestDidFinishNotification, object: play1.moviePlayer)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! playListTableViewCell
        cell.palyListImage.image = image
        cell.labelName.text = name[indexPath.row]
        cell.labelTime.text = time[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deletAction = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) -> Void in
            self.name.removeAtIndex(indexPath.row)
            self.time.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        return [deletAction]
    }
    
    @IBAction func rightButtonItem(sender: UIBarButtonItem) {
        if sender.tag == 10{
            super.setEditing(true, animated: true)
            self.tableView.setEditing(true, animated: true)
            itemButton.title = "完成"
            itemButton.tag = 20
        }else{
            self.tableView.setEditing(false, animated: true)
            itemButton.title = "编辑"
            itemButton.tag = 10        }
    }
    func thumImageGet(noti:NSNotification) {
        let thumImage = noti.userInfo![MPMoviePlayerThumbnailImageKey] as! UIImage
        image = thumImage
        print("执行")
    }
    
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    override func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
//        return 500
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            self.name.removeAtIndex(indexPath.row)
//            self.time.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
