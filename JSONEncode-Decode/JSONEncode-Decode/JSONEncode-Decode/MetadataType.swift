//
//  MetadataType.swift
//  JSONEncode-Decode
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 yuaming. All rights reserved.
//

import Foundation

enum MetadataType: Codable {
  case double(Double)
  case string(String)
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    do {
      self = try .double(container.decode(Double.self))
    } catch DecodingError.typeMismatch {
      do {
        self = try .string(container.decode(String.self))
      } catch DecodingError.typeMismatch {
        throw DecodingError.typeMismatch(MetadataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "타입이 맞지 않습니다."))
      }
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .double(let double):
      try container.encode(double)
    case .string(let string):
      try container.encode(string)
    }
  }
}
