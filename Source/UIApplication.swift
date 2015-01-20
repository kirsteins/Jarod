//
//  UIApplication.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 12/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import UIKit

extension UIApplication {
    public var versionNumber: String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]! as String
    }
    
    public var bundleVersionNumber: String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleVersion"]! as String
    }
}