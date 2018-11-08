//
//  PureFunction.swift
//  FPBasis
//
//  Created by yuaming on 05/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation

/*
    Pure Function
    - Output은 Input에 의해서만 결정
    - 함수의 수행 과정에서 외부에 있는 값을 사용하지 않음
    - 외부 값을 변경하지 않음
    - Side-effect가 없음
 */

//var name = "FP"
//var greeting = ""

//func makeGreeting() {
//    greeting = "Hello, \(name)"
//}

//func greeting(_ name: String) -> String {
//    return "Hello, \(name)"
//}


// 동일한 값을 입력하더라도 실행 때 마다 다른 결과를 얻으므로 순수함수가 아님
//let greet = "Hello"
//func greeting(_ name: String) -> String {
//    return "\(greet), \(name)"
//}

//func add(_ a: Int) -> Int {
//    return Int.random(in: 1...100) + a
//}


// 실습
//var sum = 0
//func solution(_ nums: [Int]) -> Int {
//    for i in nums {
//        sum += i
//    }
//    
//    return sum
//}


func solution1(_ nums: [Int]) -> Int {
    var sum = 0
    
    for i in nums {
        sum += i
    }
    
    return sum
}
