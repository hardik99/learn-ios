//
//  A.swift
//  Segues
//
//  Created by yuaming on 07/10/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

class A: UIViewController {
  var randomElement : Element! {
    return Element(name: "#\(Int.random(in: 0..<100))")
  }
  
  @IBAction func unwindToA(unwindSegue: UIStoryboardSegue){
    print("unwind")
  }
}

extension A: SourceForB, SourceForC, SourceForD {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    segue.prepare(sender: sender)
  }
  
  func prepare(for segue: UIStoryboardSegue, from sender: Any?, toB vc: B) {
    vc.element = self.randomElement
  }
  
  func prepare(for segue: UIStoryboardSegue, from sender: Any?, toC vc: C) {
    vc.element1 = self.randomElement
    vc.element2 = self.randomElement
    vc.opCode = .Op1
  }
  
  func prepare(for segue: UIStoryboardSegue, from sender: Any?, toD vc: D) {
    if segue.identifier == "View" {
      vc.status = "View Mode"
    } else if segue.identifier == "Edit" {
      vc.status = "Edit Mode"
    } else {
      fatalError("A Error:)")
    }
  }
}
