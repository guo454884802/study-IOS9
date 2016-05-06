//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by  wj on 16/1/15.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var dependentPicker: UIPickerView!
    private var stateZips:[String:[String]]!
    private var states:[String]!
    private var zips:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("statedictionary", withExtension: "plist")
        stateZips = NSDictionary(contentsOfURL: plistURL!) as! [String:[String]]
        let allStates = stateZips.keys
        states = Array(allStates).sort(<)
        
        let selectedState = states[0]
        zips = stateZips[selectedState]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        let stateRow = dependentPicker.selectedRowInComponent(0)
        let zipRow = dependentPicker.selectedRowInComponent(1)
        let state = states[stateRow]
        let zip = zips[zipRow]
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "好的", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return states.count
        }else{
            return zips.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return states[row]
        }else{
            return zips[row]
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(1)
            dependentPicker.selectRow(0, inComponent: 1, animated: true)
        }
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == 1{
            return pickerWidth / 3
        }else{
            return 2 * pickerWidth / 3
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
