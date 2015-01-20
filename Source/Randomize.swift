//
//  Randomize.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension Int {
    public static func randomFrom(#range: Range<Int>) -> Int {
        let difference = range.endIndex - range.startIndex
        let randomPick = arc4random_uniform(UInt32(difference))
        return Int(randomPick) + range.startIndex
    }
}
