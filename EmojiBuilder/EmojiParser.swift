//
//  EmojiParser.swift
//  EmojiBuilder2
//
//  Created by Skye on 1/18/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

import Foundation

class EmojiParser {
    // MARK: Public
    func transformToDict(rangeArray: [Range<Int>]) -> [Dictionary<String,String>] {
        var duplicateDict = Dictionary<String,String>()
        var dictArray = [Dictionary<String,String>]()
        
        for range in rangeArray {
            var emojiDict = Dictionary<String,String>()

            for i in range {
                let emojiChar = String(UnicodeScalar(i))
                let emojiName =  trimUnicodeString(unicodeNameForString(emojiChar)).toCamelCase()
                if ((emojiName.characters.first == "<") == false) {
                    if (duplicateDict[emojiChar] == nil) {
                        duplicateDict[emojiChar] = emojiName
                        emojiDict[emojiChar] = emojiName
                    }
                }
            }
            dictArray.append(emojiDict)
        }
        return dictArray
    }
    
    // MARK: Private
    private func unicodeNameForString(string: String) -> String {
        let cfString = NSMutableString(string: String(string)) as CFMutableString
        var range = CFRangeMake(0, CFStringGetLength(cfString))
        CFStringTransform(cfString, &range, kCFStringTransformToUnicodeName, Bool(0))
        return cfString as String
    }
    
    private func trimUnicodeString(string: String) -> String {
        return string.chopFrom(3).chopLast()
    }
    
}

