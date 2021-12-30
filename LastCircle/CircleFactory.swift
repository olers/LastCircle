//
//  CircleFactory.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/3.
//

import Foundation

class CircleFactory {
    var circles = [Circle]()
    init() {
//        for _ in Range(1...1) {
            addCircle()
//        }
        
    }
    
    func addCircle() {
        while true {
            let circle = Circle.randomCircle()
            if isCircleAvailable(circle) {
                self.circles.append(circle)
                break
            }
        }
    }
    
    func isCircleAvailable(_ nowCircle: Circle) -> Bool {
        for circle in circles {
            let dis = hypotf(Float(nowCircle.center.x - circle.center.x), Float(nowCircle.center.y - circle.center.y))
            if dis <= Float(nowCircle.radius + circle.radius) {
                return false
            }
        }
        return true
    }
}

