//
//  detailViewController.swift
//  FoodPin
//
//  Created by  wj on 15/10/11.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class detailViewController: UITableViewController{
    
   
   
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var restaurant:Restaurant!
//    var restaurantName = ""
//    var restaurantLocation = ""
//    var restaurantType = ""
//    var restaurantImage = ""
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! detailViewTableCell
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "phone"
            cell.valueLabel.text = restaurant.phoneNumber
        case 4:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = restaurant.isVisited ? "我以前来过" : "没来过"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            
        }
        //让cell的颜色变成透明的
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       image.image = UIImage(named: restaurant.image)
        self.tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        //去除下面的没有内容的线
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        //设置分割线的颜色
       self.tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        // Do any additional setup after loading the view.
        title = restaurant.name
        self.tableView.estimatedRowHeight = 36.0
       self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func close(segue:UIStoryboardSegue){
        if let sourceVC = segue.sourceViewController as? ReviewViewController{
            if let rating = sourceVC.rating{
                self.restaurant.rating = rating
               
                self.ratingButton.setImage(UIImage(named: rating), forState: UIControlState.Normal)
            }
        }
    }
}
