//
//  NSFileManager.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension NSFileManager {
    public class var applicationDocumentsDirectory: NSURL? {
        var urls = NSFileManager.defaultManager().URLsForDirectory(
            .DocumentDirectory,
            inDomains: .UserDomainMask
        )
        
        return urls.last as? NSURL
    }
    
    public class func urlForFileInDocumentsDirectory(#filename: String) -> NSURL? {
        return applicationDocumentsDirectory?.URLByAppendingPathComponent(filename)
    }
    
    public class func pathForFileInDocumentsDirectory(#filename: String) -> String? {
        return applicationDocumentsDirectory?.path?.stringByAppendingPathComponent(filename)
    }
}