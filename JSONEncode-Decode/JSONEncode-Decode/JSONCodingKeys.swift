//
//  JSONCodingKeys.swift
//  JSONEncode-Decode
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 yuaming. All rights reserved.
//

import Foundation

struct JSONCodingKeys: CodingKey {
  private(set) var stringValue: String
  
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  
  var intValue: Int?
  
  init?(intValue: Int) {
    self.init(stringValue: "\(intValue)")
    self.intValue = intValue
  }
}
