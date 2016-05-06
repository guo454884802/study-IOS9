//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var message1 = "Hello Swift! How can I get started"
message1.uppercaseString
message1.lowercaseString

let messageLabel = UILabel(frame: CGRectMake(0, 0, 300, 50))
messageLabel.text = message1
messageLabel

messageLabel.backgroundColor = UIColor.greenColor()
messageLabel.textAlignment = NSTextAlignment.Center
messageLabel.layer.cornerRadius = 10.0
messageLabel.clipsToBounds = true
messageLabel