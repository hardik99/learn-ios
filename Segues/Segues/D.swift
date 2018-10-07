//
//  D.swift
//  Segues
//
//  Created by yuaming on 07/10/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

protocol SourceForD {
  func prepare(for segue: UIStoryboardSegue, from sender: Any?, toD vc: D)
}

class D: UIViewController {
  var status : String!
  
  @IBOutlet weak var statusLabel : UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    assert(self.status != nil)
    self.statusLabel.text = self.status
  }
}

extension D: SegueDestination {
  func prepareAsDestination(segue: UIStoryboardSegue, sender: Any?) {
    let sourceForD = segue.source as! SourceForD
    sourceForD.prepare(for: segue, from: sender, toD: self)
  }
}
