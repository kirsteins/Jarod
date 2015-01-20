//
//  String.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension String {
    public mutating func removePrefix(prefix: String) -> Bool {
        if self.hasPrefix(prefix) {
            self.removeRange(prefix.startIndex..<prefix.endIndex)
            return true
        }
        
        return false
    }
    
    public mutating func removeSuffix(suffix: String) -> Bool {
        if self.hasSuffix(suffix) {
            var range = Range<String.Index>(
                start: advance(self.startIndex, countElements(self) - countElements(suffix)),
                end: self.endIndex
            )
            
            self.removeRange(range)
            return true
        }
        
        return false
    }
    
    public mutating func replacePrefix(prefix: String, withString string: String) -> Bool {
        if self.removePrefix(prefix) {
            self = string + self
            return true
        }
        
        return false
    }
    
    public mutating func replaceSuffix(suffix: String, withString string: String) -> Bool {
        if self.removeSuffix(suffix) {
            self += string
            return true
        }
        
        return false
    }
}

extension String {
    public mutating func capitalizeFirstLetter() {
        self = prefix(self, 1).capitalizedString + suffix(self, countElements(self) - 1)
    }
}

extension String {
    public mutating func trimWhitespaceAndNewlineCharacters() {
        self = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}

extension String {
    public var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)!
        return emailTest.evaluateWithObject(self)
    }
}
