//
//  Sequence.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

public func cleanValues<T>(values: [T?]) -> [T] {
    return values.filter{$0 != nil}.map{$0!}
}

public func cleanValues<T>(values: T?...) -> [T] {
    return cleanValues(values)
}

public func all<T>(values: [T], test: (T) -> Bool) -> Bool {
    for item in values {
        if test(item) == false {
            return false
        }
    }
    
    return true
}

public func findFirst<T>(#value: T, inValues elements: [T], condition: (element: T) -> Bool) -> Int? {
    for (index, element) in enumerate(elements) {
        if condition(element: element) {
            return index
        }
    }
    
    return nil
}
