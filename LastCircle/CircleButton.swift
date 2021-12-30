//
//  CircleButton.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/5.
//

import Foundation
import UIKit

protocol CircleButtonDelegate: AnyObject {
    func clickOn(_ cb: CircleButton)
}

class CircleButton: UIButton {
    
    var delegate: CircleButtonDelegate?
    
    static var lastCircleButton = CircleButton()
    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    init(circleView: CircleView) {
        super.init(frame: circleView.frame)
        self.layer.cornerRadius = circleView.layer.cornerRadius
        self.backgroundColor = circleView.backgroundColor
//        self.backgroundColor = .clear
        self.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.setTitle("\(circleNum)", for: .normal)
        self.setTitleColor(self.backgroundColor?.invertColor(), for: .normal)
//        self.titleLabel?.text = "\(circleNum)111"
//        self.titleLabel?.textColor = self.backgroundColor?.invertColor(for: self.backgroundColor)
//        self.clipsToBounds = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let radius:CGFloat = (self.frame.width / 2)
        var point:CGPoint = CGPoint()

        if let touch = touches.first {
            point = touch.location(in: self.superview)
        }

        let distance:CGFloat = sqrt(CGFloat(powf((Float(self.center.x - point.x)), 2) + powf((Float(self.center.y - point.y)), 2)))

        if(distance <= radius) {
            super.touchesBegan(touches, with: event)
        }
    }
    
    @objc func tapButton() {
        self.delegate?.clickOn(self)
    }
}
