//
//  StringExtensions.swift
//  EmojiBuilder2
//
//  Created by Skye on 1/18/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

import Foundation

extension String {
    subscript(var digitIndex: Int) -> String {
        let start = self.startIndex.advancedBy(digitIndex)
        return self[start...start]
    }
    
    subscript(subRange: Range<Int>) -> String {
        let start = self.startIndex.advancedBy(subRange.startIndex)
        let end = self.startIndex.advancedBy(subRange.endIndex - 1)
        return self[start...end]
    }
    
    func chop(subRange: Range<Int>) -> String {
        let start = self.startIndex.advancedBy(subRange.startIndex)
        let end = self.startIndex.advancedBy(subRange.endIndex)
        return self.substringWithRange(start..<end)
    }
    
    func chopFrom(start: Int) -> String {
        return self.substringFromIndex(self.startIndex.advancedBy(start))
    }
    
    func chopLast() -> String {
        return self.substringToIndex(self.endIndex.advancedBy(-1))
    }
    
    func toCamelCase() -> String {
        var capitalizedString = self.capitalizedString;
        capitalizedString = capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "")
        capitalizedString = capitalizedString.stringByReplacingOccurrencesOfString("-", withString: "")
        capitalizedString.replaceRange(startIndex...startIndex, with: String(self[self.startIndex]).lowercaseString)
        return capitalizedString
    }
}
