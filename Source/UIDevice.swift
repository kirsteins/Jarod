//
//  UIDevice.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

#if os(iOS)
    import UIKit
    
    public struct SystemVersion: StringLiteralConvertible, Comparable {
        public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
        public typealias UnicodeScalarLiteralType = StringLiteralType
        
        public let version: String
        
        public init(version: String) {
            self.version = version
        }
        
        public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
            self.version = "\(value)"
        }
        
        public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
            self.version = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.version = value
        }
    }
    
    public func == (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
        return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedSame)
    }
    
    public func > (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
        return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedDescending)
    }
    
    public func >= (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
        return (lhs.version.compare(rhs.version, options: .NumericSearch) != .OrderedAscending)
    }
    
    public func < (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
        return (lhs.version.compare(rhs.version, options: .NumericSearch) == .OrderedAscending)
    }
    
    public func <= (lhs: SystemVersion, rhs: SystemVersion) -> Bool {
        return (lhs.version.compare(rhs.version, options: .NumericSearch) != .OrderedDescending)
    }
    
    extension UIDevice {
        public class var currentSystemVersion: SystemVersion {
            return SystemVersion(version: self.currentDevice().systemVersion)
        }
        
        public class var isPad: Bool {
            return (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        }
        
        public class var isPhone: Bool {
            return (UIDevice.currentDevice().userInterfaceIdiom == .Phone)
        }

		public class var screenWidth: CGFloat {
			return UIScreen.mainScreen().bounds.size.width
		}

		public class var screenHeight: CGFloat {
			return UIScreen.mainScreen().bounds.size.height
		}

		public class var screenMaxLength: CGFloat {
			return max(UIDevice.screenWidth, UIDevice.screenHeight)
		}

		public class var screenMinLength: CGFloat {
			return min(UIDevice.screenWidth, UIDevice.screenHeight)
		}

		public class var isIPhone4: Bool {
			return UIDevice.isPhone && UIDevice.screenMaxLength < 568.0
		}

		public class var isIPhone5: Bool {
			return UIDevice.isPhone && UIDevice.screenMaxLength == 568.0
		}

		public class var isIPhone6: Bool {
			return UIDevice.isPhone && UIDevice.screenMaxLength == 667.0
		}

		public class var isIPhone6Plus: Bool {
			return UIDevice.isPhone && UIDevice.screenMaxLength == 736.0
		}
    }

//	struct ScreenSize
//	{
//		static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
//		static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
//		static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
//		static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
//	}
//
//	struct DeviceType
//	{
//		static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
//		static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
//		static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
//		static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
//	}

    public func iPad(closure: () -> ()) {
        if UIDevice.isPad {
            closure()
        }
    }
    
    public func iPhone(closure: () -> ()) {
        if UIDevice.isPhone {
            closure()
        }
    }
    
#endif
