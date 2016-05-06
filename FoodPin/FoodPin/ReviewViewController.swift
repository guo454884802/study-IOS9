//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by  wj on 15/10/21.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating:String?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBAction func ratingBtnTapped(sender: UIButton) {
        
        switch sender.tag{
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        default:
            break
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var greatButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueEffect = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: blueEffect)
        effectView.frame = view.frame
        imageView.addSubview(effectView)
        
        let scale = CGAffineTransformMakeScale(0, 0)
        let tranlate = CGAffineTransformMakeTranslation(0, 500)
        dislikeButton.transform = CGAffineTransformConcat(scale, tranlate)
        likeButton.transform = CGAffineTransformConcat(scale, tranlate)
        greatButton.transform = CGAffineTransformConcat(scale, tranlate)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(1.5) { () -> Void in
//            self.dislikeButton.transform = CGAffineTransformIdentity
//            UIView.animateWithDuration(1, animations: { () -> Void in
//                self.likeButton.transform = CGAffineTransformIdentity
//            })
//        }
//        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
//            self.dislikeButton.transform = CGAffineTransformIdentity
//            }, completion: nil)
        UIView.animateWithDuration(1, delay: 0, options: [], animations: { () -> Void in
             self.dislikeButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 1, options: [], animations: { () -> Void in
            self.likeButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 2, options: [], animations: { () -> Void in
            self.greatButton.transform = CGAffineTransformIdentity
            }, completion: nil)
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

}
