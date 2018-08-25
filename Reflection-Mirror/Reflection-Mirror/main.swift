//
//  main.swift
//  Reflection-Mirror
//
//  Created by yuaming on 2018. 8. 25..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import Foundation

let decoder = FieldsDecoder()
let u = try User(from: decoder)
print(decoder.keys.map { $0.snakeCased })

//func fieldsAndValues(_ value: Any) -> [(String, NodeRepresentable)] {
//    let m = Mirror(reflecting: value)
//    return m.children.map { child in
//        (child.label!, child.value as! NodeRepresentable)
//    }
//}
//

// User.insert에서 key, value 직접 입력하는 것이 아니라 Tuple 결과물을 이용하여 insert 쿼리를 만들 수 있음. 그러나, 사용이 불편함
//let user = User(name: "name", createdAt: Date(), updatedAt: Date(), githubId: 123)
//print(fieldsAndValues(user))
