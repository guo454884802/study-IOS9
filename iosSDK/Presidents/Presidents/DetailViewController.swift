//
//  DetailViewController.swift
//  Presidents
//
//  Created by  wj on 16/1/20.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIPopoverControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    private var languageButton:UIBarButtonItem?
    private var languagePopoverController:UIPopoverController?

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
                languageButton = UIBarButtonItem(title: "选择语言", style: .Plain, target: self, action: "toggleLanguagePopover")
                navigationItem.rightBarButtonItem = languageButton
            }
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                let dict = detail as! [String:String]
                let urlString = dict["url"]
                label.text = urlString
                
                let name = dict["name"]
                title = name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func toggleLanguagePopover(){
        if languagePopoverController == nil{
            let languageListController = LanguageViewController()
            languageListController.detailViewController = self
            languagePopoverController = UIPopoverController(contentViewController: languageListController)
            languagePopoverController?.presentPopoverFromBarButtonItem(languageButton!, permittedArrowDirections: .Any, animated: true)
        }else{
            languagePopoverController?.dismissPopoverAnimated(true)
            languagePopoverController = nil
        }
    }
    func popoverControllerDidDismissPopover(popoverController: UIPopoverController) {
        if popoverController == languagePopoverController {
            languagePopoverController = nil
        }
    }
}

