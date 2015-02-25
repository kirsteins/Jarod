//
//  UserDefinedRuntimeAttributes.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    
    extension UIButton {
        public var localizedTitle: String? {
            set { self.setTitle(newValue?.localized, forState: .Normal) }
            get { return self.titleForState(.Normal) }
        }
    }
    
    extension UIBarButtonItem {
        public var localizedTitle: String? {
            set { self.title = newValue?.localized }
            get { return self.title }
        }
    }
    
    extension UIViewController {
        public var localizedTitle: String? {
            set { self.title = newValue?.localized }
            get { return self.title }
        }
    }
    
    extension UILabel {
        public var localizedText: String? {
            set { self.text = newValue?.localized }
            get { return self.text }
        }
    }

	extension UITextView {
		public var localizedText: String? {
			set { self.text = newValue?.localized }
			get { return self.text }
		}
	}
#endif
