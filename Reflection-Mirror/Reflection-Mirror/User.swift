//
//  User.swift
//  Reflection-Mirror
//
//  Created by yuaming on 2018. 8. 25..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var createdAt: Date
    var updatedAt: Date
    var githubId: Int
}

extension User {
    func insert(_ conn: Connection) -> () {
        conn.execute(query: "INSERT INTO users (name, created_at, updated_at, github_id) VALUES ($1, $2, $3, $4)", values: [name, createdAt, updatedAt, githubId])
    }
}

//extension User {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
//        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
//        self.githubId = try container.decode(Int.self, forKey: .githubId)
//    }
//}
