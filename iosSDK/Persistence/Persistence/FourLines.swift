//
//  FourLines.swift
//  Persistence
//
//  Created by  wj on 16/1/5.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class FourLines: NSObject,NSCoding,NSCopying {
    var lines:[String]?
    let linesKey = "linesKey"
    
    override init() {
    }
    required init(coder decoder:NSCoder){
        lines = decoder.decodeObjectForKey(linesKey) as? [String]
    }
    func encodeWithCoder(coder: NSCoder) {
        if let saveLines = lines{
            coder.encodeObject(saveLines,forKey: linesKey)
        }
    }
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = FourLines()
        if let linesToCopy = lines {
            var newLines = Array<String>()
            for line in linesToCopy{
                newLines.append(line)
            }
            copy.lines = newLines
        }
        return copy
    }

}
