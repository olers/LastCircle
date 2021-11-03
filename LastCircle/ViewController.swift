//
//  ViewController.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/1.
//

import UIKit

class ViewController: UIViewController {
    var circleFactory = CircleFactory()
    var circleViews = [CircleView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(UIScreen.main.bounds)
        for circle in circleFactory.circles {
            let circleView = CircleView(circle: circle)
            circleViews.append(circleView)
        }
        for i in circleViews {
            self.view.addSubview(i)
        }
    }

}

