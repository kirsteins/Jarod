//
//  UIDevice.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import UIKit

public struct SystemVersion: StringLiteralConvertible, Comparable {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = StringLiteralType
    
    public let version: String
    
    public init(version: String) {
        self.version = version
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.version = "\(value)"
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.version = value
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.version = value
    }
}

public func == (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
    return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedSame)
}

public func > (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
    return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedDescending)
}

public func >= (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
    return (lhs.version.compare(rhs.version, options: .NumericSearch) != .OrderedAscending)
}

public func < (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
    return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedAscending)
}

public func <= (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
    return (lhs.version.compare(rhs.version, options: .NumericSearch) != .OrderedDescending)
}

extension UIDevice {
    public class var currentSystemVersion: SystemVersion {
        return SystemVersion(version: self.currentDevice().systemVersion)
    }
    
    public class var isPad: Bool {
        return (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
    }
    
    public class var isPhone: Bool {
        return (UIDevice.currentDevice().userInterfaceIdiom == .Phone)
    }
}

public func iPad(closure: () -> ()) {
    if UIDevice.isPad {
        closure()
    }
}

public func iPhone(closure: () -> ()) {
    if UIDevice.isPhone {
        closure()
    }
}
