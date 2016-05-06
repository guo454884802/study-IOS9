//
//  TinyPixDocument.swift
//  TinyPix
//
//  Created by  wj on 16/1/22.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class TinyPixDocument: UIDocument {
    private var bitmap:[UInt8]
    
    override init(fileURL url: NSURL) {
        bitmap = [0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80]
        super.init(fileURL: url)
    }
    
    func stateAt(row row:Int,column:Int) -> Bool{
        let rowByte = bitmap[row]
        let result = UInt8(1 << column) & rowByte
        return result != 0
    }
    func setState(state:Bool,atRow row:Int,column:Int){
        var rowByte = bitmap[row]
        print(bitmap)
        if state == false {
            rowByte = rowByte | UInt8(1 << column)
        }else{
            rowByte = rowByte & ~UInt8(1 << column)
        }
        print("\(state),\(row),\(column)")
        print("\(rowByte)" + "!!!!")
        bitmap[row] = rowByte
        print(bitmap)
    }
    func toggleStateAt(row:Int,column:Int){
        let state = stateAt(row: row, column: column)
        setState(state, atRow: row, column: column)
    }
    override func contentsForType(typeName: String) throws -> AnyObject {
        print("保存文件的路径\(fileURL)")
        let bitmapData = NSData(bytes: bitmap, length: bitmap.count)
        return bitmapData
    }
    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
        print("从\(fileURL)中加载文件")
        let bitmapData = contents as! NSData
        bitmapData.getBytes(UnsafeMutablePointer(bitmap), length: bitmap.count)
        
    }
}
