//
//  ViewController.swift
//  ViewExamples2
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

extension UIUserInterfaceSizeClass: CustomStringConvertible {
  public var description: String {
    return {
      switch self {
      case .unspecified: return "unspecified"
      case .regular: return "regular"
      case .compact: return "compact"
      }
      }()
  }
}

class ViewController: UIViewController {
  var v2: UIView!
  var constraintsWith = [NSLayoutConstraint]()
  var constraintsWithout = [NSLayoutConstraint]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // #1. Constraints
//    constraints()
    
    // #2. iOS11 > Safe Area
//    constraints2()
    
    // #3. Swap Constratins
//    constraintsSwapping()
    
    // #5. layoutMarginsGuide, safeAreaLayoutGuide, readableContentGuide
    makeLayoutGuides()
  }
  
  // #4. UIUserInterfaceSizeClass > iPhone XR, XS, XS Max
  // - UserInterfaceStyle 추가됨
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
    let tc = self.traitCollection
//    print("Horizontal:", tc.horizontalSizeClass)
//    print("Vertical:", tc.verticalSizeClass)
//    print("Scale:", tc.displayScale)
//    print("UIUserInterfaceStyle:", tc.userInterfaceStyle.rawValue)
    
    /*
     iPhone 5s: compact, regular, 2.0; compact, compact, 2.0
     iPhone 8 Plus: compact, regular, 3.0; regular, compact, 3.0
     iPhone X: compact, regular, 3.0; compact, compact, 3.0
     iPhone XR: compact, regular, 2.0; regular, compact, 2.0
     iPhone XS: compact, regular, 3.0; compact, compact, 3.0
     iPhone XS Max: compact, regular, 3.0; regular, compact, 3.0
     
     So, the XR and XS Max are like the Plus models as far as size classes go
     */
  }
  
  @IBAction func doSwap(_ sender: Any) {
    if self.v2.superview != nil {
      // 모든 제약 조건, View 삭제함
      self.v2.removeFromSuperview()
      NSLayoutConstraint.deactivate(self.constraintsWith)
      NSLayoutConstraint.activate(self.constraintsWithout)
    } else {
      self.view.addSubview(v2)
      NSLayoutConstraint.deactivate(self.constraintsWithout)
      NSLayoutConstraint.activate(self.constraintsWith)   
    }
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
  
  func constraintsSwapping() {
    let v1 = UIView()
    v1.backgroundColor = .red
    v1.translatesAutoresizingMaskIntoConstraints = false
    let v2 = UIView()
    v2.backgroundColor = .yellow
    v2.translatesAutoresizingMaskIntoConstraints = false
    let v3 = UIView()
    v3.backgroundColor = .blue
    v3.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addSubview(v1)
    self.view.addSubview(v2)
    self.view.addSubview(v3)
    
    self.v2 = v2
    
    let c1 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-(20)-[v(100)]", metrics: nil, views: ["v": v1])
    let c2 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-(20)-[v(100)]", metrics: nil, views: ["v": v2])
    let c3 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-(20)-[v(100)]", metrics: nil, views: ["v": v3])
    let c4 = NSLayoutConstraint.constraints(withVisualFormat:"V:|-(100)-[v(20)]", metrics: nil, views: ["v": v1])
    let c5with = NSLayoutConstraint.constraints(withVisualFormat:"V:[v1]-(20)-[v2(20)]-(20)-[v3(20)]", metrics: nil, views: ["v1": v1, "v2": v2, "v3": v3])
    let c5without = NSLayoutConstraint.constraints(withVisualFormat:"V:[v1]-(20)-[v3(20)]", metrics: nil, views: ["v1": v1, "v3": v3])
    
    // First set of constraints
    self.constraintsWith.append(contentsOf: c1)
    self.constraintsWith.append(contentsOf: c2)
    self.constraintsWith.append(contentsOf: c3)
    self.constraintsWith.append(contentsOf: c4)
    self.constraintsWith.append(contentsOf: c5with)
    
    // Second set of constraints
    self.constraintsWithout.append(contentsOf: c1)
    self.constraintsWithout.append(contentsOf: c3)
    self.constraintsWithout.append(contentsOf: c4)
    self.constraintsWithout.append(contentsOf: c5without)
    
    NSLayoutConstraint.activate(self.constraintsWith)
    
    // Ignore, just testing new iOS 10 read-only properties
    do {
      let c = self.constraintsWith[0]
      print(c.firstItem as Any)
      print(c.firstAnchor)
    }
  }
  
  func makeLayoutGuides() {
    let redView = MyView()
    redView.backgroundColor = .red
    redView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(redView)
    
    NSLayoutConstraint.activate([
      NSLayoutConstraint.constraints(withVisualFormat:"H:|-(0)-[v]-(0)-|", metrics: nil, views: ["v": redView]),
      NSLayoutConstraint.constraints(withVisualFormat:"V:|-(0)-[v]-(0)-|", metrics: nil, views: ["v": redView])
    ].flatMap{$0})
    
    let greenView = MyView()
    greenView.backgroundColor = .green
    greenView.translatesAutoresizingMaskIntoConstraints = false
    redView.addSubview(greenView)
    
    var which: Int { return 4 }
    
    switch which {
    case 1:
      NSLayoutConstraint.activate([
        NSLayoutConstraint.constraints(withVisualFormat:"H:|-[v1]-|", metrics: nil, views: ["v1": greenView]),
        NSLayoutConstraint.constraints(withVisualFormat:"V:|-[v1]-|", metrics: nil, views: ["v1": greenView])
      ].flatMap{$0})
      
    case 3:
      // UILayoutGuide
      NSLayoutConstraint.activate([
        greenView.topAnchor.constraint(equalTo: redView.layoutMarginsGuide.topAnchor),
        greenView.bottomAnchor.constraint(equalTo: redView.layoutMarginsGuide.bottomAnchor),
        greenView.trailingAnchor.constraint(equalTo: redView.layoutMarginsGuide.trailingAnchor),
        greenView.leadingAnchor.constraint(equalTo: redView.layoutMarginsGuide.leadingAnchor)
      ])
      
    case 4:
      // Safe Area
      NSLayoutConstraint.activate([
        greenView.topAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.topAnchor),
        greenView.bottomAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.bottomAnchor),
        greenView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.trailingAnchor),
        greenView.leadingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor)
      ])
    
    case 5:
      // Readable content: 읽기 전용 앱. 특히 iPad에서 사용하는 것이 좋음
      NSLayoutConstraint.activate([
        greenView.topAnchor.constraint(equalTo: redView.readableContentGuide.topAnchor),
        greenView.bottomAnchor.constraint(equalTo: redView.readableContentGuide.bottomAnchor),
        greenView.trailingAnchor.constraint(equalTo: redView.readableContentGuide.trailingAnchor),
        greenView.leadingAnchor.constraint(equalTo: redView.readableContentGuide.leadingAnchor)
      ])
      
    default:break
    }
    
    // Let's give the red view big margins
//    redView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40)
//    greenView.preservesSuperviewLayoutMargins = true

    // Turn off safe area affecting margins
//   redView.insetsLayoutMarginsFromSafeArea = false
    
    // Let's give the main view big margins
//    self.view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40)
//    redView.preservesSuperviewLayoutMargins = true
    
    // No Effect
    self.view.directionalLayoutMargins = .zero
    self.viewRespectsSystemMinimumLayoutMargins = false
    // Turn off `safeAreaInsets`
    self.view.insetsLayoutMarginsFromSafeArea = false
    
    // Safe area changes before layoutSubviews is called
    delay(2) {
      print("Delay 2")
      print("Green Top", greenView.frame.origin.y)
      print("Green Safe", greenView.safeAreaInsets)
      
      print("VC systemMinimumLayoutMargins", self.systemMinimumLayoutMargins)
      print("VC viewRespectsSystemMinimumLayoutMargins", self.viewRespectsSystemMinimumLayoutMargins)
      print("Red layoutMargins", redView.layoutMargins)
      print("greenView layoutMargins", greenView.layoutMargins)
      /*
      UIExtendedSRGBColorSpace 1 0 0 1 Did move to superview
      UIExtendedSRGBColorSpace 0 1 0 1 Did move to superview
      UIExtendedSRGBColorSpace 1 0 0 1 Safe area changed to UIEdgeInsets(top: 44.0, left: 0.0, bottom: 0.0, right: 0.0)
      UIExtendedSRGBColorSpace 1 0 0 1 Safe area changed to UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)
      UIExtendedSRGBColorSpace 1 0 0 1 LayoutSubviews
      UIExtendedSRGBColorSpace 0 1 0 1 Safe area changed to UIEdgeInsets(top: 44.0, left: 0.0, bottom: 0.0, right: 0.0)
      UIExtendedSRGBColorSpace 0 1 0 1 Safe area changed to UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      UIExtendedSRGBColorSpace 0 1 0 1 LayoutSubviews
       
      Delay 2
      Green Top 44.0
      Green Safe UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      VC systemMinimumLayoutMargins NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
      VC viewRespectsSystemMinimumLayoutMargins false
      Red layoutMargins UIEdgeInsets(top: 52.0, left: 8.0, bottom: 42.0, right: 8.0)
      greenView layoutMargins UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
      */
    }
  }
}

class MyView: UIView {
  override func safeAreaInsetsDidChange() {
    print(self.backgroundColor!, "Safe area changed to", self.safeAreaInsets)
    super.safeAreaInsetsDidChange()
  }
  
  override func didMoveToSuperview() {
    print(self.backgroundColor!, "Did move to superview")
  }
  
  override func layoutSubviews() {
    print(self.backgroundColor!, "LayoutSubviews")
    super.layoutSubviews()
  }
}
