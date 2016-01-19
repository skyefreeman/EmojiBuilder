//
//  ExtensionGenerator.swift
//  EmojiBuilder2
//
//  Created by Skye on 1/18/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

import Foundation

class EmojiCodeGenerator: NSObject {
    let fileManager: NSFileManager
    let desktopDirectory: NSURL
    
    override init() {
        fileManager = NSFileManager.defaultManager()
        desktopDirectory = try! fileManager.URLForDirectory(.DesktopDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }
    
    // MARK: File manager
    func createExtension(fileName: String, emojiDictArray: [Dictionary<String,String>]) {
        // Create a new file
        let fileDestination = desktopDirectory.URLByAppendingPathComponent(fileName + ".swift").relativePath
        fileManager.createFileAtPath(fileDestination!, contents: nil, attributes: nil)
        
        // build the code string
        var codeString = "\n\nimport Foundation\n\nstruct Emoji {"
        for dict in emojiDictArray {
            for key in dict.keys {
                codeString += "\n static let \(dict[key]!) = \"\(key)\""
            }
        }
        codeString += "\n}"
        
        // write to file
        print(codeString)
        try! codeString.writeToFile(fileDestination!, atomically: true, encoding: NSUTF8StringEncoding)
    }
}

//import Foundation
//
//struct Emoji {
//    static let blah = "blah"
//}