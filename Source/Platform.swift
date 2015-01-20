//
//  Platform.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

public func ios(closure: () -> ()) {
    #if os(iOS)
        closure()
    #endif
}

public func osx(closure: () -> ()) {
    #if os(OSX)
        closure()
    #endif
}
