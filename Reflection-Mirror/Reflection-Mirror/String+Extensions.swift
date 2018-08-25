//
//  String+Extensions.swift
//  Reflection-Mirror
//
//  Created by yuaming on 2018. 8. 25..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import Foundation

extension String {
    var snakeCased: String {
        guard !self.isEmpty else { return self }
        let stringKey = self 
        
        var words : [Range<String.Index>] = []

        // myProperty -> my_property
        // myURLProperty -> my_url_property
        var wordStart = stringKey.startIndex
        var searchRange = stringKey.index(after: wordStart)..<stringKey.endIndex
        
        while let upperCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.uppercaseLetters,
                                                              options: [],
                                                              range: searchRange) {
            let untilUpperCase = wordStart..<upperCaseRange.lowerBound
            words.append(untilUpperCase)
            
            searchRange = upperCaseRange.lowerBound..<searchRange.upperBound
            guard let lowerCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.lowercaseLetters, options: [], range: searchRange) else {
                wordStart = searchRange.lowerBound
                break
            }
            
            let nextCharacterAfterCapital = stringKey.index(after: upperCaseRange.lowerBound)
            if lowerCaseRange.lowerBound == nextCharacterAfterCapital {
                wordStart = upperCaseRange.lowerBound
            } else {
                let beforeLowerIndex = stringKey.index(before: lowerCaseRange.lowerBound)
                words.append(upperCaseRange.lowerBound..<beforeLowerIndex)
                wordStart = beforeLowerIndex
            }
                                                                
            searchRange = lowerCaseRange.upperBound..<searchRange.upperBound
        }
        
        words.append(wordStart..<searchRange.upperBound)
        
        let result = words.map({ (range) in
            return stringKey[range].lowercased()
        }).joined(separator: "_")
        
        return result
    }
}
