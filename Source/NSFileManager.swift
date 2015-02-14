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

	public class var applicationLibraryDirectory: NSURL? {
		var urls = NSFileManager.defaultManager().URLsForDirectory(
			.LibraryDirectory,
			inDomains: .UserDomainMask
		)

		return urls.last as? NSURL
	}

    public class func urlForFileInDocumentsDirectory(#filename: String) -> NSURL? {
        return self.applicationDocumentsDirectory?.URLByAppendingPathComponent(filename)
    }
    
    public class func pathForFileInDocumentsDirectory(#filename: String) -> String? {
        return self.applicationDocumentsDirectory?.path?.stringByAppendingPathComponent(filename)
    }

	public class func urlForFileInLibraryDirectory(#filename: String) -> NSURL? {
		return self.applicationLibraryDirectory?.URLByAppendingPathComponent(filename)
	}

	public class func pathForFileInLibraryDirectory(#filename: String) -> String? {
		return self.applicationLibraryDirectory?.path?.stringByAppendingPathComponent(filename)
	}
}
