//
//  Float.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 04/02/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension String {
    func toFloat() -> Float {
        return (self as NSString).floatValue
    }
}