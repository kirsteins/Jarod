//
//  BezierPath.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 04/02/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation


#if os(iOS)
    import UIKit
    
    extension UIBezierPath {
        public func fillWithGradientDescription(var gradient: Gradient, startPoint: CGPoint, endPoint: CGPoint) {
            var coreGraphicsGradient = CGGradientCreateWithColorComponents(
                CGColorSpaceCreateDeviceRGB(),
                gradient.components,
                gradient.locations,
                UInt(gradient.locations.count)
            )
            
            var ctx = UIGraphicsGetCurrentContext()
            
            CGContextSaveGState(ctx);
            fill()
            addClip();
            
            CGContextDrawLinearGradient(
                ctx,
                coreGraphicsGradient,
                startPoint,
                endPoint,
                0
            )
            
            CGContextRestoreGState(ctx)
        }
        
        func translate(x: CGFloat, _ y: CGFloat) {
            self.applyTransform(CGAffineTransformMakeTranslation(x, y))
        }
        
        func scale(x: CGFloat, _ y: CGFloat) {
            self.applyTransform(CGAffineTransformMakeScale(x, y))
        }
    }
    
    extension UIBezierPath {
        public func duplicate() -> UIBezierPath {
            return self.copy() as UIBezierPath
        }
    }
#endif

#if os(OSX)
    import Cocoa
    // TODO:
#endif
