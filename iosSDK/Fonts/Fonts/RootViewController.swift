//
//  RootViewController.swift
//  Fonts
//
//  Created by  wj on 16/1/18.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private var familyNames:[String]!
    private var cellPointSize:CGFloat!
    private var favoritesList:FavoritesList!
    private let familyCell = "FamilyName"
    private let favoritesCell = "Favorites"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ab = UIFont.familyNames()
        familyNames = Array(ab).sort(<)
        
        for i in familyNames{
            if UIFont.fontNamesForFamilyName(i) == [] {
                let number = familyNames.indexOf(i)
                familyNames.removeAtIndex(number!)
            }
        }
        
        let preferredTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredTableViewFont.pointSize
        favoritesList = FavoritesList.sharedFavoriteList
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return favoritesList.favorites.isEmpty ? 1 : 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? familyNames.count : 1
    }
    func fontForDisplay(atIndexPath indexPath:NSIndexPath) -> UIFont?{
        if indexPath.section == 0{
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNamesForFamilyName(familyName).first! as String
           
            
            return UIFont(name: fontName, size: cellPointSize)
        }else{
            return nil
        }
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorites Font"
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(familyCell, forIndexPath: indexPath) as UITableViewCell
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
        }else{
            return tableView.dequeueReusableCellWithIdentifier(favoritesCell, forIndexPath: indexPath) as UITableViewCell
        }
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

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        let listVC = segue.destinationViewController as! FontListViewController
        
        if indexPath?.section == 0{
            let familyName = familyNames[indexPath!.row]
            listVC.fontNames = Array(UIFont.fontNamesForFamilyName(familyName)).sort(<)
            listVC.navigationItem.title = familyName
            listVC.showsFavorites = false
        }else{
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }
    }
    

}
