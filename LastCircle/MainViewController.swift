//
//  ViewController.swift
//  LastCircle
//
//  Created by Magic Line on 2021/11/1.
//
// TODO: addTransView 改为异步操作


import UIKit

var circleNum = 0

class ViewController: UIViewController {
    var circleFactory = CircleFactory()
    var circleViews = [CircleView]()
    var circleButtons = [CircleButton]()
    var lastCircleButton: CircleButton {
        return self.circleButtons.last!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    func initData() {
        circleNum = 0
        circleFactory.circles.removeAll()
        circleFactory.addCircle()
        circleViews.removeAll()
        circleButtons.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        initData()
        
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
    
    func addTransView(with color: UIColor) {
        let transView = UIView(frame: UIScreen.main.bounds)
        transView.backgroundColor = color
        self.view.addSubview(transView)
//        sleep(1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            transView.removeFromSuperview()
        }
//        transView.backgroundColor = .clear

    }
    
    func addGameOverView() {
        let gameOverView = UIView(frame: UIScreen.main.bounds)
        gameOverView.backgroundColor = .red
        self.view.addSubview(gameOverView)
        
        let bound = UIScreen.main.bounds
        let gameOverLabel = UILabel(frame: CGRect(x: bound.minX, y: bound.minY - 20, width: bound.width, height: bound.height))
        gameOverLabel.text = "Game Over!"
        gameOverLabel.textColor = .black
        gameOverLabel.font = UIFont.systemFont(ofSize: 38)
        gameOverLabel.textAlignment = .center
        
        self.view.addSubview(gameOverLabel)
        
        let hintLabel = UILabel(frame: CGRect(x: bound.minX, y: bound.minY - 20, width: bound.width, height: bound.height))
        hintLabel.numberOfLines = 0
        hintLabel.text = "\n\n\n\n点击任意位置返回主界面"
        hintLabel.textColor = .gray
        hintLabel.font = UIFont.systemFont(ofSize: 16)
        hintLabel.textAlignment = .center
        self.view.addSubview(hintLabel)
        
        let gameOverButton = UIButton(frame: UIScreen.main.bounds)
//        gameOverButton.setTitle("Gme Over!", for: .normal)
//        gameOverButton.setTitleColor(.black, for: .normal)
        gameOverButton.addTarget(self, action: #selector(gameOver), for: .touchUpInside)
        self.view.addSubview(gameOverButton)
    }
    
    @objc func gameOver() {
//        self.view.subviews.removeLast()
        while self.view.subviews.first != nil {
            self.view.subviews.first?.removeFromSuperview()
        }
//        self.reloadInputViews()
        self.viewWillAppear(true)
        
    }
}

extension ViewController: CircleButtonDelegate {
    func clickOn(_ cb: CircleButton) {
//        if cb !== circleButtons.last! {
//            self.reloadInputViews()
//        }
        if cb !== lastCircleButton {
            addGameOverView()
            return
        }
        
        
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
        
        addTransView(with: cb.backgroundColor!)
        
    }
}



