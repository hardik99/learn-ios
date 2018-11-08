//
//  HigherOrderFunction.swift
//  FPBasis
//
//  Created by yuaming on 05/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation


/*
    Higher-order Function
    - 1급개체
    - 함수를 파라미터로 받거나 함수를 리턴하는 함수
 */
// filter

//func multiply(_ a: Int) -> (Int) -> Int {
//    return { b in
//        return a * b
//    }
//}

//let x10 = multiply(10)
//let area2 = x10(20)

let f: (Int) -> Bool = { number in
    return number % 2 == 0
}

let s: (Int, Int) -> Int = { number1, number2 in
    return number1 + number2
}

func solution2(_ nums: [Int]) -> Int {
    return nums.filter(f).reduce(0, s)
}
