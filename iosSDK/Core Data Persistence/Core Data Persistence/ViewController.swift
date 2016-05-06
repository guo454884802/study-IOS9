//
//  ViewController.swift
//  Core Data Persistence
//
//  Created by  wj on 16/1/6.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var lineFields: [UITextField]!
    private let lineEntityName = "Line"
    private let lineNumberkey = "lineNumber"
    private let lineTextKey = "lineText"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: lineEntityName)
        
        do{
            let objects = try context.executeFetchRequest(request)
            if let objectList = objects{
                
            }
        }catch{
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

