//
//  UIKeyboard.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 07/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

#if os(iOS)
import UIKit

public struct KeyboardInfo {
    let info: NSDictionary
    
    public init(info: NSDictionary) {
        assert(info[UIKeyboardAnimationCurveUserInfoKey] is NSNumber?)
        assert(info[UIKeyboardAnimationDurationUserInfoKey] is NSNumber?)
        assert(info[UIKeyboardFrameBeginUserInfoKey] is NSValue?)
        assert(info[UIKeyboardFrameEndUserInfoKey] is NSValue?)
        
//        @availability(iOS, introduced=3.2)
//        let UIKeyboardFrameBeginUserInfoKey: NSString! // NSValue of CGRect
//        @availability(iOS, introduced=3.2)
//        let UIKeyboardFrameEndUserInfoKey: NSString! // NSValue of CGRect
//        @availability(iOS, introduced=3.0)
//        let UIKeyboardAnimationDurationUserInfoKey: NSString! // NSNumber of double
//        @availability(iOS, introduced=3.0)
//        let UIKeyboardAnimationCurveUserInfoKey: NSString! // NSNumber of NSUInteger (UIViewAnimationCurve)
    
        self.info = info
    }
    
    public var animationCurve: UIViewAnimationCurve {
        let value = self.info[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber as Int
        return UIViewAnimationCurve(rawValue: value)!
    }
    
    public var animationDuration: NSTimeInterval {
        return self.info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber as NSTimeInterval
    }
    
    public var beginFrame: CGRect {
        let value = self.info[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        return value.CGRectValue()
    }
    
    public var endFrame: CGRect {
        let value = self.info[UIKeyboardFrameEndUserInfoKey] as! NSValue
        return value.CGRectValue()
    }
}
    
#endif
