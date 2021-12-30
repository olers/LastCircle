//
//  CircleView.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/3.
//

import Foundation
import UIKit

class CircleView: UIView {
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(circle: Circle) {
        let frame = CGRect(x: circle.center.x - CGFloat(circle.radius), y: circle.center.y - CGFloat(circle.radius), width: CGFloat(circle.radius * 2), height: CGFloat(circle.radius * 2) )
        super.init(frame: frame)
        self.backgroundColor = circle.color
        self.layer.cornerRadius = CGFloat(circle.radius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
