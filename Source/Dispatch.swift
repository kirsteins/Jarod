//
//  Dispatch.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

public func mainThread(block: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), block)
}

public func mainThreadAfter(#seconds: Double, block: () -> ()) {
    let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(dispatchTime, dispatch_get_main_queue(), block)
}