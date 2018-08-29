//
//  ViewController.swift
//  TopCurvedViewExample
//
//  Created by yuaming on 2018. 8. 29..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(TopCurvedView(frame: view.frame))
    view.addSubview(BottomCurvedView(frame: CGRect(x: 0, y: 100,
                                                   width: view.frame.width,
                                                   height: view.frame.height)))
  }
}

class TopCurvedView: UIView {
  override func draw(_ rect: CGRect) {
    let color = UIColor.red
    let y: CGFloat = 30
    let bezier = UIBezierPath(rect: CGRect(x: 0, y: 0, width: rect.width, height: y))
    bezier.move(to: CGPoint(x: 0, y: y))
    bezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: rect.height / 3))
    bezier.close()
    color.setFill()
    bezier.fill()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.clear
    self.transform = transform.rotated(by: .pi)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.backgroundColor = UIColor.clear
    self.transform = transform.rotated(by: .pi)
  }
}

class BottomCurvedView: UIView {
  override func draw(_ rect: CGRect) {
    let color = UIColor.orange
    let y: CGFloat = 30
    let bezier = UIBezierPath(rect: CGRect(x: 0, y: 0, width: rect.width, height: y))
    bezier.move(to: CGPoint(x: 0, y: y))
    bezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: rect.height / 3))
    bezier.close()
    color.setFill()
    bezier.fill()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.clear
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.backgroundColor = UIColor.clear
  }
}
