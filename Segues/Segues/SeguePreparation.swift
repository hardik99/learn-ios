//
//  SeguePreparation.swift
//  Segues
//
//  Created by yuaming on 07/10/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
  func prepare(sender: Any?) {
    guard let destination = self.destination as? SegueDestination else {
      fatalError("\(self.destination) prepare")
    }
    
    destination.prepareAsDestination(segue: self, sender: sender)
  }
}

protocol SegueDestination {
  func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?)
}

extension UINavigationController: SegueDestination {
  func prepareAsDestination(segue: UIStoryboardSegue, sender: Any?) {
    guard let destination = self.topViewController as? SegueDestination else {
      fatalError("prepareAsDestination")
    }
    
    destination.prepareAsDestination(segue: segue, sender: sender)
  }
}
