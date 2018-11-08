//
//  Composition.swift
//  FPBasis
//
//  Created by yuaming on 08/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation


/*
    Compostion
    - 함수의 반환값이 다른 함수의 입력값으로 사용되는 것
    - 함수의 반환값과 이것을 입력으로 받아들이는 값은 타입이 서로 같아야 함
 */

func f1(_ i: Int) -> Int {
    return i * 2
}

func f2(_ i: Int) -> String {
    return "\(i)"
}

//let result = f2(f1(100))

func ff(_ pf1: @escaping (Int) -> Int, _ pf2: @escaping (Int) -> String) -> (Int) -> String {
    return { i in
        return pf2(pf1(i))
    }
}

let f3 = ff(f1, f2)
let result = f3(100)

func comp<A, B, C>(_ pf1: @escaping (A) -> B, _ pf2: @escaping (B) -> C) -> (A) -> C {
    return { i in
        return pf2(pf1(i))
    }
}

let f4 = comp(f1, f2)


func filterEven(_ ns: [Int]) -> [Int] {
    return ns.filter { $0 % 2 == 0 }
}

func sum(_ ns: [Int]) -> Int {
    return ns.reduce(0) { $0 + $1 }
}

let filteredSum = comp(filterEven, sum)

func solution3(_ nums: [Int]) -> Int {
    return filteredSum(nums)
}
