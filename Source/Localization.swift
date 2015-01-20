//
//  Localization.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

public func localizedString(string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
