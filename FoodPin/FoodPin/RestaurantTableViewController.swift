//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by  wj on 15/9/28.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var restaurants = [Restaurant(name: "Cafe Deadend", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "Coffee & Tea Shop", image: "cafedeadend.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Homei", location: "G/F,72 Po Hing Fong,sheung Wan,Hong KongPo Hing Fong,sheung Wan,Hong Kong", type: "Cafe", image: "homei.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Teakha", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "Tea House", image: "teakha.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Cafe Loisl", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "French", image: "cafeloisl.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Petitle Oyster", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "Bakery", image: "petiteoyster.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "For Kee Restaurant", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "Chocolate", image: "forkeerestaurant.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Po's Atelier", location: "G/F,72 Po Hing Fong,sheung Wan,Hong Kong", type: "Cafe", image: "posatelier.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Bourke Street Bakery", location: "Sydney", type: "American", image: "bourkestreetbakery.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Haigh's Chocolate", location: "Sydney", type: "American", image: "haighschocolate.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Palomino Espresso", location: "Sydney", type: "American", image: "palominoespresso.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Upstate", location: "Sydney", type: "American", image: "upstate.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Traif", location: "New York", type: "American", image: "traif.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Graham Avenue Meats And Deli", location: "New York", type: "American", image: "grahamavenuemeats.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Waffie & Wolf", location: "New York", type: "American", image: "wafflewolf.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Five Leaves", location: "New York", type: "American", image: "fiveleaves.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Cafe Lore", location: "New York", type: "American", image: "cafelore.jpg", phoneNumber:"123-776221",isVisited: false),Restaurant(name: "cafelore.jpg", location: "New York", type: "American", image: "cafelore.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Confessional", location: "New York", type: "Cafe", image: "confessional.jpg", phoneNumber:"123-776221",isVisited: false),Restaurant(name: "Barrafina", location: "London", type: "American", image: "barrafina.jpg",phoneNumber:"123-776221", isVisited: false),Restaurant(name: "Donostia", location:  "American", type: "London", image: "donostia.jpg", phoneNumber:"123-776221",isVisited: false),Restaurant(name: "Royal Oak", location: "London", type: "American", image: "royaloak.jpg", phoneNumber:"123-776221",isVisited: false),Restaurant(name: "Thai Cafe", location: "London", type: "American", image: "thaicafe.jpg",phoneNumber:"123-776221", isVisited: false)]
    
    
//    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petitle Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffie & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","Thai Cafe"]
//    var 餐馆图片 =
//    ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
//    var restaurantLocations = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Sydney","Sydney","Sydney","New York","New York","New York","New York","New York","New York","New York","London","London","London","London"]
//    var restaurantType = ["Coffee & Tea Shop","Cafe","Tea House","French","Bakery","Chocolate","Cafe","American","American","American","American","American","American","American","American","American","American","American","American","American","American"]
    var haveBeen = ""
   // var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
    var restaurantCheck = [Bool](count: 22, repeatedValue: true)
//    var block = {(action:UIAlertAction) -> Void in
//       }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantTableViewCell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locatLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.checkMark.image = UIImage(named: "heart")
        cell.checkMark.hidden = restaurantCheck[indexPath.row]
        //改变图像的形状，正变圆
        //cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
//        cell.thumbnailImageView.clipsToBounds = true
        //消除重复使用cell的对勾bug
//        if restaurantIsVisited[indexPath.row]{
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }else{
//            cell.accessoryType = UITableViewCellAccessoryType.None
//        }
//        
        return cell
    }
    //table cell的菜单，call，分享，已经来过选项
//        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do", preferredStyle: UIAlertControllerStyle.ActionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
//        let callActionHandler = {(action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry,the call feature is not available yet.Please retry later", preferredStyle: UIAlertControllerStyle.Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (_) -> Void in
//                let aM = UIAlertController(title: "郭志强", message: "耶耶耶耶耶耶饿！！", preferredStyle: UIAlertControllerStyle.ActionSheet)
//                aM.addAction(UIAlertAction(title: "完成", style: UIAlertActionStyle.Default, handler: nil))
//                self.presentViewController(aM, animated: true, completion: nil)
//            }))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//            
//        }
//        let callAction = UIAlertAction(title: "call" + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
//        //判断是否打对勾
//        if restaurants[indexPath.row].isVisited{
//            haveBeen = "I've not been here"
//            block = {(action:UIAlertAction) -> Void in
//                let cell1 = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantTableViewCell
//                cell1.checkMark.hidden = true
//                self.restaurantCheck[indexPath.row] = true
//                tableView.reloadData()
// //                let cell = tableView.cellForRowAtIndexPath(indexPath)
// //                cell?.accessoryType = .None
//                self.restaurants[indexPath.row].isVisited = false}
//        }else{
//            haveBeen = "I've been here"
//            block = {(action:UIAlertAction) -> Void in
//                let cell1 = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantTableViewCell
//                
//                cell1.checkMark.hidden = false
//                self.restaurantCheck[indexPath.row] = false
//                tableView.reloadData()
//  //                 let cell = tableView.cellForRowAtIndexPath(indexPath)
//  //                 cell?.accessoryType = .Checkmark
//               self.restaurants[indexPath.row].isVisited = true
//            }
//        }
//        let isVisitedAction = UIAlertAction(title: haveBeen, style: UIAlertActionStyle.Default, handler: block)
// //        let isVisitedAction = UIAlertAction(title: haveBeen, style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in
// //            let cell = tableView.cellForRowAtIndexPath(indexPath)
// //            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
// //            self.restaurantIsVisited[indexPath.row] = true
// //
// //            }
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(isVisitedAction)
//        optionMenu.addAction(cancelAction)
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        //取消被选中（灰色高亮）
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //去除返回按钮的标题
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        

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
        return restaurants.count
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            restaurantNames.removeAtIndex(indexPath.row)
//            restaurantLocations.removeAtIndex(indexPath.row)
//            餐馆图片.removeAtIndex(indexPath.row)
//            restaurantType.removeAtIndex(indexPath.row)
// //            tableView.reloadData()
//            
//            
//            
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "分享") { (action, indexPath) -> Void in
            let shareController = UIAlertController(title: "分享", message: "选择一个分享", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let weiboAction = UIAlertAction(title: "微博", style: UIAlertActionStyle.Default, handler: nil)
            let weixinAction = UIAlertAction(title: "微信", style: UIAlertActionStyle.Default, handler: nil)
            let qqAction = UIAlertAction(title: "QQ", style: UIAlertActionStyle.Default, handler: nil)
            shareController.addAction(weiboAction)
            shareController.addAction(weixinAction)
            shareController.addAction(qqAction)
            self.presentViewController(shareController, animated: true, completion: nil)
        }
        let deletAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "删除") { (action, indexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        shareAction.backgroundColor = UIColor(red: 28/255, green: 165/255, blue: 253/255, alpha: 1)
        deletAction.backgroundColor = UIColor.blackColor()
        return [shareAction,deletAction]
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as! detailViewController
                destinationController.restaurant = restaurants[indexPath.row]      }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    //让目的控制器返回到此控制器
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){
        
    }

}
