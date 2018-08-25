//
//  NodeRepresentable.swift
//  Reflection-Mirror
//
//  Created by yuaming on 2018. 8. 25..
//  Copyright © 2018년 yuaming. All rights reserved.
//

import Foundation

protocol NodeRepresentable {}

extension Date: NodeRepresentable { }
extension Int: NodeRepresentable { }
extension Bool: NodeRepresentable { }
extension String: NodeRepresentable { }
extension Optional: NodeRepresentable where Wrapped: NodeRepresentable { }
extension UUID: NodeRepresentable { }

struct Node {}
