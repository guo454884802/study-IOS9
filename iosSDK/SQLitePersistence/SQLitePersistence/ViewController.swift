//
//  ViewController.swift
//  SQLitePersistence
//
//  Created by  wj on 16/1/6.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lineFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var database:COpaquePointer = nil
        var result = sqlite3_open(dataFilePath(),database)
        != SQLITE_OK{
            sqlite3_close(database)
            print("失败打开数据库")
            return
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dataFilePath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.stringByAppendingPathComponent("data.sqlite") as String
    }
}

