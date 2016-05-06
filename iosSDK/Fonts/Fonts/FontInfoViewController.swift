//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by  wj on 16/1/19.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font:UIFont!
    var favorite:Bool = false

    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEe" + "0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.on = favorite

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderFontSize(slider:UISlider){
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.fontWithSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    @IBAction func toggleFavorite(sender:UISwitch){
        let favoritesList = FavoritesList.sharedFavoriteList
        if sender.on{
            favoritesList.addFavorite(font.fontName)
        }else{
            favoritesList.removeDavorite(font.fontName)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
