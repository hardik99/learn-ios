//
//  MyWindow.swift
//  ViewExamples
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

class MyWindow: UIWindow {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let layer = self.layer.hitTest(point)
    print(layer?.backgroundColor as Any)
    return super.hitTest(point, with: event)
  }
}
