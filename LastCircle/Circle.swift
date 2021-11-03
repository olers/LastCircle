//
//  Circle.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/1.
//

import Foundation
import UIKit

class Circle {
    static var minRadius: Int {
        return 20
    }
    
    static var maxRadius: Int {
        return 50
    }
    
    var color: UIColor
    let radius: Int
    let center: CGPoint
    
    init(color: UIColor, radius: Int, center: CGPoint) {
        self.color = color
        self.radius = radius
        self.center = center
    }
    
    class func randomCircle() -> Circle {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.width
        let screenHeight = screenRect.height
        
        let randomRadius = minRadius + Int(arc4random_uniform( UInt32(maxRadius - minRadius) ))
        
        let x = CGFloat( randomRadius + Int(arc4random_uniform( UInt32(screenWidth - CGFloat(2 * randomRadius))) ) )
        let y = CGFloat( randomRadius + Int(arc4random_uniform( UInt32(screenHeight - CGFloat(2 * randomRadius))) ) )
        let randomCenter = CGPoint(x: x, y: y)
        
        let randomColor = UIColor.randomColor
        UIColor.randomColor
        
        let circle = Circle(color: randomColor, radius: randomRadius, center: randomCenter)
        return circle
    }
    
}