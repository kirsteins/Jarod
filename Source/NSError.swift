//
//  NSError.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 18/01/15.
//  Copyright (c) 2015 Jānis Kiršteins. All rights reserved.
//

import Foundation

extension NSError {
	public convenience init(localizedDescription: String) {
		self.init (
			domain: "MusicTheoryKit.Archiver",
			code: 0,
			userInfo: [NSLocalizedDescriptionKey : localizedDescription]
		)
	}
}