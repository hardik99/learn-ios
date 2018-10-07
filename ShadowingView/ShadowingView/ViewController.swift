//
//  ViewController.swift
//  ShadowingView
//
//  Created by yuaming on 07/10/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let purpleView = UIView(frame: CGRect(x: 20, y: 40, width: 100, height: 100))
    purpleView.backgroundColor = .purple
    purpleView.layer.shadowRadius = 10.0
    purpleView.layer.shadowColor = UIColor.black.cgColor
    purpleView.layer.shadowOffset = CGSize()
    purpleView.layer.shadowOpacity = 0.8
    view.addSubview(purpleView)
    
    let purpleView2 = UIView(frame: CGRect(x: 20, y: 150, width: 100, height: 100))
    purpleView2.backgroundColor = .purple
    purpleView2.layer.cornerRadius = 16.0
    purpleView2.layer.shadowColor = UIColor.black.cgColor
    purpleView2.layer.shadowOffset = CGSize()
    purpleView2.layer.shadowOpacity = 0.8
    purpleView2.layer.shadowPath = UIBezierPath(roundedRect: purpleView2.bounds, cornerRadius: 16.0).cgPath
    view.addSubview(purpleView2)
  }
}

