//
//  ViewController.swift
//  16进制转uicolor
//
//  Created by  wj on 15/11/14.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("gL-20_18_57", ofType: "txt")
        
        let sstring = getFileContent(path!)
      //  var a = sstring.substringFromIndex(2)
        print(sstring.length)
        var c = 0
         //print(sstring.substringFromIndex(46))
        //print(sstring.substringWithRange(NSMakeRange(40, 4)))
        for(var i = 0;i < (sstring.length - 2082);i++ ){
            if c < 167{
            if sstring.substringWithRange(NSMakeRange(i, 5)) == "FF FF"{
                c++
                var str:String?
               let filePath:String = NSHomeDirectory() + "/Documents/data\(0).txt"
                print(filePath)
                for(var j = 0;j <= 2064;j += 3){
                let fileHandle = NSFileHandle(forUpdatingAtPath: filePath)
                fileHandle?.seekToEndOfFile()
                    var number = 0
                    var number1 = 0
//                    if sstring.substringWithRange(NSMakeRange(i + 6 + j, 1)) == " "{
////                        for(var u = 0;sstring.substringWithRange(NSMakeRange(i + j + u + 6, 1)) == " ";u++){
////                            str = "0x" + sstring.substringWithRange(NSMakeRange(i + j + u + 6, 2))  + ","
////                        }
//                        number += 1
//                        if sstring.substringWithRange(NSMakeRange(i + 6 + j + number, 1)) == " "{
//                            number1 += 1
//                            str = sstring.substringWithRange(NSMakeRange(i + 6 + j + 1 + number1, 3))
//                            j++
//                        }else{
//                     str =  sstring.substringWithRange(NSMakeRange(i + 6 + j + number, 3))
//                            j++
//                        }
//                        number1 = 0
//                    }else{
                     str =  sstring.substringWithRange(NSMakeRange(i + 6 + j , 3))
//                    }
                let stringData = str!.dataUsingEncoding(NSUTF8StringEncoding)
                fileHandle?.writeData(stringData!)
                fileHandle?.closeFile()
                 number = 0
                }
//                do{
//                    try (//for(var j = 0 ;j <= 1350;j++){
//                        
//                        sstring.substringWithRange(NSMakeRange(i + 5, 2077)) + ";;;;").writeToFile(filePath , atomically: true, encoding: NSUTF8StringEncoding)
//                    //}
//                }catch{
//                    print(error)
//                }
                print(sstring.substringWithRange(NSMakeRange(i, 5)))
                print(i)
                i += 2082
            }
            }
        }
        print(c)
    
//        let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
//        do{
//            try sstring.substringFromIndex(17012).writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
//        }catch{
//            print(error)
//        }
       // print(filePath)
       //      print(aData)
        
//        let fileURL = NSBundle.mainBundle().URLForResource("tiger副本", withExtension: "txt")
//        
//        let manager = NSFileManager.defaultManager()
//       opriateForURL: nil, create: false)
//        var nsurl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tiger副本", ofType: "txt")!)
//        let file = nsurl.URLByAppendingPathComponent("tiger副本.txt")
//        
//        let data = manager.contentsAtPath(file.path!)
//        let readString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//        let readHandler = try! NSFileHandle(forReadingFromURL: file)
//        let data = readHandler.readDataToEndOfFile()
//        let readString = NSString(data: data, encoding: NSUTF8StringEncoding)
//        
      //  print(readString)
       // let aData = path?.dataUsingEncoding(NSUTF8StringEncoding)
       // print(aData)
      //  convertHexStrToData("ff")
//        image.image = path.
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getFileContent(path:String) -> NSString{
        guard path.characters.count > 0 else{
            return ""
        }
        if NSFileManager.defaultManager().fileExistsAtPath(path){
            do{
                let content = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                //print(content)
                return content
            }catch{
                return ""
            }
        }else{
            return ""
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func processUsingPixels(array:String) -> UIImage{
//      
//    }
//    func convertHexStrToData(str:String) -> NSData{
//        let hexData = NSMutableData(capacity: 8)
//        var number = 0
//        var number1 = 2
//        let index = str.startIndex.advancedBy(number)
//        let index1 = str.startIndex.advancedBy(number1)
//        let range = Range<String.Index>(start: index, end:index1)
//       
//        for(var i = 0;i < str.characters.count;i += 2){
//            let anInt:UInt32 = 0
//            let hexCharStr = str.substringWithRange(range)
//            let scanner = NSScanner(string: hexCharStr)
//            
//            scanner.scanHexInt(nil)
//            let entity = NSData(bytes: &anInt, length: 1)
//            hexData?.appendData(entity)
//            number += 2
//            number1 += 2
//        }
//        print(hexData)
//        return hexData!
//    }
//
    
}

