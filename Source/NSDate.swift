//
//  NSDate.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 14/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension NSDate {
    public convenience init(year: Int, month: Int, day: Int, hour: Int, minute: Int = 0, second: Int = 0) {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        self.init(timeInterval: 0, sinceDate: NSCalendar.currentCalendar().dateFromComponents(components)!)
    }
    
    public convenience init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0)
    }
}