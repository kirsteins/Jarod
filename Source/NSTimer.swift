//
//  NSTimer.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 14/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension NSTimer {
    public class func scheduledTimer(#interval: NSTimeInterval, repeats: Bool = false, handler: NSTimer! -> ()) -> NSTimer {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let repeatInterval = repeats ? interval : 0
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, repeatInterval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
}