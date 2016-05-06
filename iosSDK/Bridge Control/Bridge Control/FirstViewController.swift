//
//  FirstViewController.swift
//  Bridge Control
//
//  Created by  wj on 16/1/21.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var officerLabel: UILabel!
    @IBOutlet weak var authorizationCodeLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var warpDriveLabel: UILabel!
    @IBOutlet weak var warpFactorLabel: UILabel!
    @IBOutlet weak var favoriteTeaLabel: UILabel!
    @IBOutlet weak var favoriteCaptainLabel: UILabel!
    @IBOutlet weak var favoriteGadgetLabel: UILabel!
    @IBOutlet weak var favoriteAlienLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshFields(){
        let defaults = NSUserDefaults.standardUserDefaults()
        officerLabel.text = defaults.stringForKey(officerKey)
        authorizationCodeLabel.text = defaults.stringForKey(authorizationCodeKey)
        rankLabel.text = defaults.stringForKey(rankKey)
        warpDriveLabel.text = defaults.boolForKey(warpDriveKey) ? "Engaged" : "不用"
        warpFactorLabel.text = defaults.objectForKey(warpFactorKey)?.stringValue
        favoriteTeaLabel.text = defaults.stringForKey(favoriteTeaKey)
        favoriteCaptainLabel.text = defaults.stringForKey(favoriteCaptainKey)
        favoriteGadgetLabel.text = defaults.stringForKey(favoriteGadgeKey)
        favoriteAlienLabel.text = defaults.stringForKey(favoriteAlienKey)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        refreshFields()
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object: app)
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

