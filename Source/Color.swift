//
//  Color.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
    
    extension UIColor {
        public convenience init(_ red: Int, _ green: Int, _ blue: Int) {
            self.init(red, green, blue, 1.0)
        }
        
        public convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat) {
            assert(0...255 ~= red)
            assert(0...255 ~= green)
            assert(0...255 ~= blue)
            assert(alpha >= 0.0 && alpha <= 1.0)
            
            self.init(
                red: CGFloat(red) / 255.0,
                green: CGFloat(green) / 255.0,
                blue: CGFloat(blue) / 255.0,
                alpha: alpha
            )
        }
        
        public convenience init(_ hexValue: Int) {
            assert(0...16777215 ~= hexValue)
            
            self.init(
                red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexValue & 0xFF00) >> 8) / 255.0,
                blue: CGFloat(hexValue & 0xFF) / 255.0,
                alpha: 1.0
            )
        }
    }
#endif

#if os(OSX)
    import Cocoa
    public typealias Color = NSColor
    // TODO:
    
#endif
