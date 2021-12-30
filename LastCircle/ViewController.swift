//
//  ViewController.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/1.
//

import UIKit

var circleNum = 0

class ViewController: UIViewController {
    var circleFactory = CircleFactory()
    var circleViews = [CircleView]()
    var circleButtons = [CircleButton]()
    
    @objc func work() {
        circleFactory.addCircle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(UIScreen.main.bounds)
        for circle in circleFactory.circles {
            circleNum += 1
            let circleView = CircleView(circle: circle)
            circleViews.append(circleView)
            let button = CircleButton(circleView: circleView)
            button.delegate = self
            circleButtons.append(button)
        }
        for i in circleViews {
            self.view.addSubview(i)
        }
        for i in circleButtons {
            self.view.addSubview(i)
        }
    }
}

extension ViewController: CircleButtonDelegate {
    func clickOn(_ cb: CircleButton) {
//        if cb !== circleButtons.last! {
//            self.reloadInputViews()
//        }
        print(cb.center, terminator: "")
        print(" screenWidth=\(self.view.bounds.width)")
        circleFactory.addCircle()
        let circle = circleFactory.circles.last!
        let circleView = CircleView(circle: circle)
        circleViews.append(circleView)
        circleNum += 1
        let button = CircleButton(circleView: circleView)
        button.delegate = self
        circleButtons.append(button)
        self.view.addSubview(circleView)
        self.view.addSubview(circleButtons.last!)
        
    }
}

