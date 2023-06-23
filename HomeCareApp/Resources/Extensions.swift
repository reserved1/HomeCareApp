import SwiftUI
////
////  Extensions.swift
////  HomeCare
////
////  Created by Luciana Adrião on 19/06/23.
////
//
//import Foundation
//import SwiftUI
//
//extension Font {
//
//    enum CyreneFont {
//        case title
//        case custom(String)
//
////        var value: String {
////            switch self {
////
////            case .title:
////                ret
////            case .custom(let text):
////                return text
////            }
////        }
//    }
//}
//extension CGPoint.CGMultiplier {
//    enum DirectionY {
//        case up
//        case down
//
//        func getValue(value: CGFloat) -> CGFloat {
//            switch self {
//            case .up:
//                return -value
//            case .down:
//                return value
//            }
//        }
//    }
//
//}
//
//extension CGPoint.CGMultiplier {
//    enum DirectionX {
//        case left
//        case right
//
//        func getValue(value: CGFloat) -> CGFloat {
//            switch self {
//            case .left:
//                return -value
//            case .right:
//                return value
//            }
//        }
//    }
//}
//
//extension CGPoint {
//    struct CGMultiplier {
//
//        var xMult: CGFloat
//        var yMult: CGFloat
//
//        init(xMult: CGFloat, onDirection direction: DirectionX) {
//
//            self.xMult = direction.getValue(value: xMult)
//            self.yMult = 0.0
//        }
//
//        init(yMult: CGFloat, onDirection direction: DirectionY) {
//            self.xMult = 0.0
//            self.yMult = direction.getValue(value: yMult)
//        }
//
//        init(xMult: CGFloat, onDirection directionx: DirectionX, yMult: CGFloat, onDirection directiony: DirectionY) {
//
//            self.xMult = directionx.getValue(value: xMult)
//            self.yMult = directiony.getValue(value: yMult)
//        }
//
//        static var constant = CGMultiplier.init(xMult: 0.0, onDirection: .left, yMult: 0.0, onDirection: .down)
//    }
// }
//
// extension CGPoint {
//    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
//        let result = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
//        return result
//    }
//    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
//        let result = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
//        return result
//    }
//
//    static func * (lhs: CGPoint, rhs: CGMultiplier ) -> CGPoint {
//        let result = CGPoint(x: lhs.x * (1+rhs.xMult), y: lhs.y * (1+rhs.yMult))
//        return result
//    }
// }

/// Chamada -> Font.roboto(size: 17, style: .regular).uiFont
enum Font {
    enum Style:String {
        case medium = "Medium"
        case semiBold = "SemiBold"
    }

    case dosis(size: CGFloat, style: Style)
    case cyrene(size: CGFloat)

    var uifont: UIFont? {
        switch self {
        case .dosis(let size, let style):
            return UIFont(name: "Dosis-\(style.rawValue)", size: size)
        case .cyrene(let size):
            return UIFont(name: "Cyrene_Regular", size: size)
        }
    }
}

extension Color {
    static let darkNeutral = Color("DarkNeutral")
    static let beige = Color("Beige")
    static let complimentary = Color("Complimentary")
    static let lightNeutral = Color("LightNeutral")
    static let customBlue = Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0))
    
}
