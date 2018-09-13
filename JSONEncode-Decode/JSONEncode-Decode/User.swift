//
//  User.swift
//  JSONEncode-Decode
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 yuaming. All rights reserved.
//

import Foundation

// Codable
struct User: Codable {
  private(set) var name: String
  private(set) var email: String
  private(set) var id: String
  private(set) var metadata: [String: MetadataType]
  
  enum CodingKeys: String, CodingKey {
    case name, email, id, metadata
  }
}
