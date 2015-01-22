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

extension Array {
    func all(test: (Element) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        
        return true
    }
}

public func findFirst<C : CollectionType>(domain: C, value: C.Generator.Element, criteria: (value: C.Generator.Element, element: C.Generator.Element) -> Bool) -> C.Index? {
    var locationIndex: C.Index?
    
    for domainValue in domain {
        if locationIndex == nil {
            locationIndex = domain.startIndex
        } else {
            advance(locationIndex!, 1)
        }
        
        if criteria(value: value, element: domainValue) {
            return locationIndex
        }
    }
    
    return nil
}
