//
//  Result.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 16/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation

public class Box<T> {
    public let unbox: T

    public init(_ value: T) {
        self.unbox = value
    }
}

public enum Result<T> {
    case Value(Box<T>)
    case Error(NSError)
}

extension Result {
    public func map<U>(f: T -> U) -> Result<U> {
        switch self {
        case let .Value(value):
            return Result<U>.Value(Box(f(value.unbox)))
        case let .Error(error):
            return Result<U>.Error(error)
        }
    }
}