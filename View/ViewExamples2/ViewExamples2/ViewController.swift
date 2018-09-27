//
//  ViewController.swift
//  ViewExamples2
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

@objc(ViewController)
class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // #1. Constraints
//    constraints()
    
    // #2. iOS11 > Safe Area
    constraints2()
  }
}

extension ViewController {
  func constraints() {
    let v1 = UIView(frame: CGRect(100, 111, 132, 194))
    v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
    let v2 = UIView()
    v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
    let v3 = UIView()
    v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
//    v3.layer.setValue("littleRedSquare", forKey:"identifier")
    
    self.view.addSubview(v1)
    v1.addSubview(v2)
    v1.addSubview(v3)
    
    v2.translatesAutoresizingMaskIntoConstraints = false
    v3.translatesAutoresizingMaskIntoConstraints = false
    
    var which : Int {return 3}
    switch which {
    case 1:
      // Old way
      v1.addConstraint(
        NSLayoutConstraint(item: v2,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: v1,
                           attribute: .leading,
                           multiplier: 1, constant: 0)
      )
      v1.addConstraint(
        NSLayoutConstraint(item: v2,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: v1,
                           attribute: .trailing,
                           multiplier: 1, constant: 0)
      )
      v1.addConstraint(
        NSLayoutConstraint(item: v2,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: v1,
                           attribute: .top,
                           multiplier: 1, constant: 0)
      )
      v2.addConstraint(
        NSLayoutConstraint(item: v2,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1, constant: 10)
      )
      v3.addConstraint(
        NSLayoutConstraint(item: v3,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1, constant: 20)
      )
      v3.addConstraint(
        NSLayoutConstraint(item: v3,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1, constant: 20)
      )
      v1.addConstraint(
        NSLayoutConstraint(item: v3,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: v1,
                           attribute: .trailing,
                           multiplier: 1, constant: 0)
      )
      v1.addConstraint(
        NSLayoutConstraint(item: v3,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: v1,
                           attribute: .bottom,
                           multiplier: 1, constant: 0)
      )
      
    case 2:
      // new API in iOS 9
      // Activate all the constraints at once
      NSLayoutConstraint.activate([
        v2.leadingAnchor.constraint(equalTo:v1.leadingAnchor),
        v2.trailingAnchor.constraint(equalTo:v1.trailingAnchor),
        v2.topAnchor.constraint(equalTo:v1.topAnchor),
        v2.heightAnchor.constraint(equalToConstant:10),
        v3.widthAnchor.constraint(equalToConstant:20),
        v3.heightAnchor.constraint(equalToConstant:20),
        v3.trailingAnchor.constraint(equalTo:v1.trailingAnchor),
        v3.bottomAnchor.constraint(equalTo:v1.bottomAnchor)
      ])
      
    case 3:
      // let d = ["v2": v2, "v3": v3]
      let d = dictionaryOfNames(v1, v2, v3)
      NSLayoutConstraint.activate([
        NSLayoutConstraint.constraints(withVisualFormat:
          "H:|[v2]|", metrics: nil, views: d),
        NSLayoutConstraint.constraints(withVisualFormat:
          "V:|[v2(10)]", metrics: nil, views: d),
        NSLayoutConstraint.constraints(withVisualFormat:
          "H:[v3(20)]|", metrics: nil, views: d),
        NSLayoutConstraint.constraints(withVisualFormat:
          "V:[v3(20)]|", metrics: nil, views: d),
        ].flatMap{$0})
    default: break
    }
    
    delay(2) {
      v1.bounds.size.width += 40
      v1.bounds.size.height -= 50
    }
  }
  
  func constraints2() {
    let v1 = UIView()
    v1.backgroundColor = .red
    v1.translatesAutoresizingMaskIntoConstraints = false
    
    let v2 = UIView()
    v2.backgroundColor = .green
    v2.translatesAutoresizingMaskIntoConstraints = false
    
    let v3 = UIView()
    v3.backgroundColor = .yellow
    v3.translatesAutoresizingMaskIntoConstraints = false
    
    // Safe Area
    // - safeAreaLayoutGuide는 View 속성
    // - topLayoutGuide, bottomLayoutGuide는 UIViewController 속성
    // - 출처: https://useyourloaf.com/blog/safe-area-layout-guide/
    self.view.addSubview(v1)
    let safe = self.view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      v1.topAnchor.constraint(equalTo: safe.topAnchor),
      v1.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
      v1.widthAnchor.constraint(equalToConstant: 70),
      v1.heightAnchor.constraint(equalToConstant: 70),
    ])
    
    // System Spacing
    self.view.addSubview(v2)
    NSLayoutConstraint.activate([
      v2.topAnchor.constraint(equalTo: v1.topAnchor, constant: 10),
      // 수직 간격
      v2.leadingAnchor.constraint(equalToSystemSpacingAfter: v1.trailingAnchor, multiplier: 1),
      v2.widthAnchor.constraint(equalToConstant: 70),
      v2.heightAnchor.constraint(equalToConstant: 70),
    ])
    
    // Intermediate Width Anchor
    let off = v1.leadingAnchor.anchorWithOffset(to: v2.trailingAnchor)
    self.view.addSubview(v3)
    NSLayoutConstraint.activate([
      // - 수평 간격
      v3.topAnchor.constraint(equalToSystemSpacingBelow: v2.bottomAnchor, multiplier: 1),
      v3.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 20),
      v3.widthAnchor.constraint(equalTo: off),
      v3.heightAnchor.constraint(equalToConstant: 70),
    ])
  }
}

