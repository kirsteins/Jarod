//
//  BezierPathData.swift
//  Jarod
//
//  Created by Jānis Kiršteins on 09/12/14.
//  Copyright (c) 2014 Jānis Kiršteins. All rights reserved.
//

#if os(iOS)
    import UIKit
#endif

#if os(OSX)
    import AppKit
#endif


enum BezierPathElementType: Int {
    case MoveTo
    case LineTo
    case CurveTo
    case Close
}

class BezierPathElement: NSObject, NSCoding {
    let type: BezierPathElementType
    let points: [NSValue]
    
    init(type: BezierPathElementType, points: [CGPoint]) {
        self.type = type
        self.points = points.map {
            #if os(iOS)
                return NSValue(CGPoint: $0)
            #endif
            
            #if os(OSX)
                return NSValue(point: $0)
            #endif
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        self.type = BezierPathElementType(rawValue: Int(aDecoder.decodeIntForKey(Key.type)))!
        self.points = aDecoder.decodeObjectForKey(Key.points) as [NSValue]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInt(Int32(self.type.rawValue), forKey: Key.type)
        aCoder.encodeObject(self.points as NSArray, forKey: Key.points)
    }
    
    struct Key {
        static let type = "type"
        static let points = "points"
    }
}

public class BezierPathData: NSObject, NSCoding {
    var elements: [BezierPathElement] = []
    
    func appendElement(element: BezierPathElement) {
        self.elements.append(element)
    }
    
    override init() {}
    
    required public init(coder aDecoder: NSCoder) {
        self.elements = aDecoder.decodeObjectForKey(Key.elements) as [BezierPathElement]
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.elements as NSArray, forKey: Key.elements)
    }
    
    struct Key {
        static let elements = "elements"
    }
}


#if os(OSX)
    extension NSBezierPath {
        var bezierPathData: BezierPathData {
            let bezierPathData = BezierPathData()
            
            for i in 0..<self.elementCount {
                var pointArray = [NSPoint](count: 3, repeatedValue: NSPoint())
                let elementType = self.elementAtIndex(0, associatedPoints: &pointArray)
                
                var element: BezierPathElement
                
                switch elementType {
                case .MoveToBezierPathElement:
                    element = BezierPathElement(type: .MoveTo, points: [pointArray[0]])
                case .LineToBezierPathElement:
                    element = BezierPathElement(type: .LineTo, points: [pointArray[0]])
                case .CurveToBezierPathElement:
                    element = BezierPathElement(type: .CurveTo, points: [pointArray[0], pointArray[1], pointArray[2]])
                case .ClosePathBezierPathElement:
                    element = BezierPathElement(type: .Close, points: [])
                }
                
                bezierPathData.appendElement(element)
            }
            
            return bezierPathData
        }
        
        convenience init(bezierPathData: BezierPathData) {
            self.init()
            
            for element in bezierPathData.elements {
                switch element.type {
                case .MoveTo:
                    self.moveToPoint(element.points[0].pointValue)
                case .LineTo:
                    self.lineToPoint(element.points[0].pointValue)
                case .CurveTo:
                    self.curveToPoint(
                        element.points[0].pointValue,
                        controlPoint1: element.points[1].pointValue,
                        controlPoint2: element.points[2].pointValue
                    )
                case .Close:
                    self.closePath()
                }
            }
        }
    }
#endif

#if os(iOS)
    extension UIBezierPath {
        convenience init(bezierPathData: BezierPathData) {
            self.init()
            
            for element in bezierPathData.elements {
                switch element.type {
                case .MoveTo:
                    self.moveToPoint(element.points[0].CGPointValue())
                case .LineTo:
                    self.addLineToPoint(element.points[0].CGPointValue())
                case .CurveTo:
                    self.addCurveToPoint(
                        element.points[0].CGPointValue(),
                        controlPoint1: element.points[1].CGPointValue(),
                        controlPoint2: element.points[2].CGPointValue()
                    )
                case .Close:
                    self.closePath()
                }
            }
        }
    }
#endif
