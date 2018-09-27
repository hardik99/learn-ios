//
//  Extensions.swift
//  ViewExamples
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
  init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
    self.init(x: x, y: y, width: w, height: h)
  }
}

extension CGSize {
  init(_ width: CGFloat, _ height: CGFloat) {
    self.init(width: width, height: height)
  }
}

extension CGPoint {
  init(_ x: CGFloat, _ y: CGFloat) {
    self.init(x: x, y: y)
  }
}

extension CGVector {
  init (_ dx: CGFloat, _ dy: CGFloat) {
    self.init(dx: dx, dy: dy)
  }
}

extension NSLayoutConstraint {
  class func reportAmbiguity (_ view: UIView?) {
    var view = view
    
    if view == nil {
      view = UIApplication.shared.keyWindow
    }
    
    for subview in view!.subviews {
      print("\(subview) \(subview.hasAmbiguousLayout)")
      if subview.subviews.count > 0 {
        self.reportAmbiguity(subview)
      }
    }
  }
  
  class func listConstraints (_ view :UIView?) {
    var view = view
    
    if view == nil {
      view = UIApplication.shared.keyWindow
    }
    
    for subview in view!.subviews {
      let arr1 = subview.constraintsAffectingLayout(for: .horizontal)
      let arr2 = subview.constraintsAffectingLayout(for: .vertical)
      // abandon use of NSLog here, because it now truncates; not even sure why I was using it
      let result = String(format: "\n\n%@\nH: %@\nV:%@", subview, arr1, arr2)
      
      print(result)
      if subview.subviews.count > 0 {
        self.listConstraints(subview)
      }
    }
  }
}
