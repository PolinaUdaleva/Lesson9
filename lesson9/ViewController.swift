//
//  ViewController.swift
//  lesson9
//
//  Created by po on 27.09.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let mySquare = UIView()
    let firstSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.gestureRec))
        let click = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecSquare))
        firstSquare.addGestureRecognizer(click)

        view.addGestureRecognizer(gesture)
        view.addSubview(firstSquare)
    }
    
    @objc func gestureRec() {
        let widthView = view.frame.size.width
        let heightView = view.frame.size.height
        mySquare.removeFromSuperview()
        
        firstSquare.backgroundColor = UIColor(
        red: CGFloat(Int.random(in: 1..<255))/255,
        green: CGFloat(Int.random(in: 1..<255))/255,
        blue: CGFloat(Int.random(in: 1..<255))/255,
        alpha: 1)
        firstSquare.snp.remakeConstraints{ (make) -> Void in
            make.width
                .height
                .equalTo(200)
            make.top.equalTo(view).offset(Int.random(in: 0..<Int((widthView - 200))))
            make.left.equalTo(view).offset(Int.random(in: 0..<Int((heightView - 200))))
        }
        view.addSubview(firstSquare)
    }
    @objc func gestureRecSquare() {
        firstSquare.addSubview(mySquare)
        mySquare.backgroundColor = .green
        mySquare.snp.remakeConstraints{ make in
            make.width
                .height
                .equalTo(50)

        }
    }
}
