//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by  wj on 16/1/21.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var engineSwitch: UISwitch!
    @IBOutlet weak var warpFactorSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        refreshFields()
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object: app)
    }
    func refreshFields(){
        let defaults = NSUserDefaults.standardUserDefaults()
        engineSwitch.on = defaults.boolForKey(warpDriveKey)
        warpFactorSlider.value = defaults.floatForKey(warpFactorKey)
    }
    @IBAction func engineSwitchTapped(sender: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(engineSwitch.on, forKey: warpDriveKey)
        defaults.synchronize()
    }

    @IBAction func warpSliderTouched(sender: UISlider) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    @IBAction func settingButtonClicked(sender: UIButton) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
    }
    func applicationWillEnterForeground(notification:NSNotification){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        refreshFields()
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

