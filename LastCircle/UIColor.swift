//
//  UIColor.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/3.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: 返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat( arc4random() % 256) / 255.0
            let green = CGFloat( arc4random() % 256) / 255.0
            let blue = CGFloat( arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    func invertColor() -> UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0
//        print("RGBBBB is : \(color?.cgColor.components)")
        let rgb = self.cgColor.components
        r = rgb![0]
        g = rgb![1]
        b = rgb![2]
        self.getRed(&r, green: &g, blue: &b, alpha: nil)
        return UIColor(red:1.0-r, green: 1.0-g, blue: 1.0-b, alpha: 1)
    }
}
