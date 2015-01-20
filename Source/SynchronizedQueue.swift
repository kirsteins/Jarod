//
//  SynchronizedQueue.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

public struct SynchronizedQueue<T> {
    private var array = [T]()
    private let accessQueue = dispatch_queue_create("com.kirsteins.SynchronizedQueue", nil)
    
    public mutating func add(newElement: T) {
        dispatch_sync(self.accessQueue) {
            self.array.append(newElement)
        }
    }
    
    public mutating func poll() -> T? {
        var element: T?
        
        dispatch_sync(self.accessQueue) {
            element = self.array.first
            
            if element != nil {
                self.array.removeAtIndex(0)
            }
        }
        
        return element
    }
}
