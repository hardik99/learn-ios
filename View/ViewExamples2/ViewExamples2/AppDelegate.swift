//
//  AppDelegate.swift
//  ViewExamples2
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = self.window ?? UIWindow()
    self.window!.rootViewController = ViewController()
    self.window!.backgroundColor = .white
    self.window!.makeKeyAndVisible()
    return true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("here")
  }
}

func delay(_ delay:Double, closure: @escaping ()->()) {
  let when = DispatchTime.now() + delay
  DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

func dictionaryOfNames(_ arr: UIView...) -> [String: UIView] {
  var dictionary = [String: UIView]()
  
  for (index, value) in arr.enumerated() {
    dictionary["v\(index+1)"] = value
  }
  
  return dictionary
}

extension NSLayoutConstraint {
  class func reportAmbiguity (_ view: UIView?) {
    var view = view
    
    if view == nil {
      view = UIApplication.shared.keyWindow
    }
    
    for subview in view!.subviews {
      // hasAmbiguousLayout: 애매한 제약 조건이 있는 경우 true 반환
      // exerciseAmbiguityInLayout: 애매한 제약 조건을 가진 View를 만족하는 조건으로 변경함
      print("\(subview) \(subview.hasAmbiguousLayout)")
      
      if subview.subviews.count > 0 {
        self.reportAmbiguity(subview)
      }
    }
  }
  class func listConstraints (_ view: UIView?) {
    var view = view
    
    if view == nil {
      view = UIApplication.shared.keyWindow
    }
    for subview in view!.subviews {
      let arr1 = subview.constraintsAffectingLayout(for: .horizontal)
      let arr2 = subview.constraintsAffectingLayout(for: .vertical)
      
      print("\n\n%@\nH: %@\nV:%@", subview, arr1, arr2);
      
      if subview.subviews.count > 0 {
        self.listConstraints(subview)
      }
    }
  }
}

extension CGRect {
  init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
    self.init(x: x, y: y, width: w, height: h)
  }
}
