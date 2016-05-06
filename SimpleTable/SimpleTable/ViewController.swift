//
//  ViewController.swift
//  SimpleTable
//
//  Created by  wj on 15/9/28.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petitle Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffie & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","Thai Cafe"]
    var restaurantImage = ["lufei","lufei1","lufei2","lufei3","lufei4","lufei5","lufei6","lufei7","lufei8","lufei9","lufei10","lufei11","","","","","","","",""]
    func tableView(tableView:UITableView,numberOfRowsInSection section:Int) -> Int{
        return restaurantNames.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named:restaurantImage[indexPath.row])
        return cell
    }
    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

