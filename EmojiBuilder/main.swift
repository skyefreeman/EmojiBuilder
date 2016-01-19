//
//  main.swift
//  EmojiBuilder2
//
//  Created by Skye on 1/17/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

import Foundation

// Build emoji unicode ranges
let emojiRanges0 = 0x1F601...0x1F64F
let emojiRanges1 = 0x2702...0x27B0
let emojiRanges2 = 0x1F680...0x1F6C0
//let emojiRanges3 = 0x24C2...0x1F251 // Causes a crash.
let emojiRanges4 = 0x1F600...0x1F636
let emojiRanges5 = 0x1F681...0x1F6C5
let emojiRanges6 = 0x1F30D...0x1F567

let emojiArray = [emojiRanges0,emojiRanges1,emojiRanges2,emojiRanges4,emojiRanges5,emojiRanges6]

// Parse unicode into an array of dictionaries (So the ranges are grouped)
let parser = EmojiParser()
let emojiDictArray = parser.transformToDict(emojiArray)

// Generate 'SFEmojiExtensions.swift' file
let extGenerator = EmojiCodeGenerator()
extGenerator.createExtension("Emoji", emojiDictArray: emojiDictArray)
