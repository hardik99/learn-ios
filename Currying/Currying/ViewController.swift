//
//  ViewController.swift
//  Currying
//
//  Created by yuaming on 2018. 9. 11..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var upButton: UIButton!
  @IBOutlet weak var downButton: UIButton!
  @IBOutlet weak var leftButton: UIButton!
  @IBOutlet weak var rightButton: UIButton!
  @IBOutlet weak var boxView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ViewController {
  enum AnimationDirection {
    case up
    case down
    case left
    case right
  }
  
  func moveBox(to: AnimationDirection) -> () -> Void {
    return {
      var frame = self.boxView.frame
      
      switch to {
      case .left:
        frame.origin.x = frame.origin.x - 100
      case .right:
        frame.origin.x = frame.origin.x + 100
      case .down:
        frame.origin.y = frame.origin.y + 100
      case .up:
        frame.origin.y = frame.origin.y - 100
      }
      
      self.boxView.frame = frame
    }
  }
  
  @IBAction func leftButtonTapped(_ sender: Any) {
    UIView.animate(withDuration: 0.5,
                   animations: moveBox(to: .left),
                   completion: nil)
  }
  
  @IBAction func rightButtonTapped(_ sender: Any) {
    UIView.animate(withDuration: 0.5,
                   animations: moveBox(to: .right),
                   completion: nil)
  }
  
  @IBAction func upButtonTapped(_ sender: Any) {
    UIView.animate(withDuration: 0.5,
                   animations: moveBox(to: .up),
                   completion: nil)
  }
  
  @IBAction func downButtonTapped(_ sender: Any) {
    UIView.animate(withDuration: 0.5,
                   animations: moveBox(to: .down),
                   completion: nil)
  }
}

//extension ViewController {
//  @IBAction func leftButtonTapped(_ sender: Any) {
//    UIView.animate(withDuration: 0.5, animations: {
//      var frame = self.boxView.frame
//      frame.origin.x = frame.origin.x - 100
//      self.boxView.frame = frame
//    }, completion: nil)
//  }
//
//  @IBAction func rightButtonTapped(_ sender: Any) {
//    UIView.animate(withDuration: 0.5, animations: {
//      var frame = self.boxView.frame
//      frame.origin.x = frame.origin.x + 100
//      self.boxView.frame = frame
//    }, completion: nil)
//  }
//
//  @IBAction func upButtonTapped(_ sender: Any) {
//    UIView.animate(withDuration: 0.5, animations: {
//      var frame = self.boxView.frame
//      frame.origin.y = frame.origin.y - 100
//      self.boxView.frame = frame
//    }, completion: nil)
//  }
//
//  @IBAction func downButtonTapped(_ sender: Any) {
//    UIView.animate(withDuration: 0.5, animations: {
//      var frame = self.boxView.frame
//      frame.origin.y = frame.origin.y + 100
//      self.boxView.frame = frame
//    }, completion: nil)
//  }
//}

