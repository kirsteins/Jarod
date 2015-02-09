//
//  CoreData.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 12/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    public func insertNewObjectForEntity(named name: String) -> NSManagedObject {
        return NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext: self) as! NSManagedObject
    }
}