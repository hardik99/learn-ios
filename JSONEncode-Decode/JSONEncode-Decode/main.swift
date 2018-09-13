//
//  main.swift
//  JSONEncode-Decode
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 yuaming. All rights reserved.
//

import Foundation

let decoder = JSONDecoder()
let userJson = """
{
    "id": "yuaming",
    "email": "miennes3@gmail.com",
    "name":"Hyeon-jeon, Kang",
    "metadata": {
      "link_id": "linked-id",
      "buy_count": 4
    }
}
""".data(using: .utf8)!

let user = try! decoder.decode(User.self, from: userJson)
print("========= JSON Decode ========= \n\n \(user) \n\n")

let encoder = PropertyListEncoder()
encoder.outputFormat = .xml
let plist = try! encoder.encode(user)

print("========= XML Encode ========= \n\n \(String(data: plist, encoding: .utf8)!)")

