//
//  Gradient.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 04/02/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

#if os(iOS)
    import UIKit
#endif

#if os(OSX)
    import Cocoa
#endif


struct Gradient {
    var locations: [CGFloat] = []
    var components: [CGFloat] = []
    
    init(locationsAndColors: (CGFloat, Color)...) {
        for locationAndColor in locationsAndColors {
            locations.append(CGFloat(1.0 - locationAndColor.0))
            
            let currentComponents = CGColorGetComponents(locationAndColor.1.CGColor)
            
            components += [
                currentComponents[0],
                currentComponents[1],
                currentComponents[2],
                1.0
            ]
        }
    }
}