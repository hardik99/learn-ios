//
//  FizzBuzz.swift
//  FPBasis
//
//  Created by yuaming on 08/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation


// # 1

//var i = 1

//func fizzbuzzMain() {
//    while i <= 100 {
//        if (i % 3 == 0 && i % 5 == 0) {
//            print("FizzBuzz")
//        } else if (i % 3 == 0) {
//            print("Fizz")
//        } else if (i % 5 == 0) {
//            print("Buzz")
//        } else {
//            print("\(i)")
//        }
//
//        i += 1
//    }
//}


// # 2

//func fizz(_ i: Int) -> String {
//    if (i % 3 == 0) {
//        return "fizz"
//    }
//
//    return ""
//}

//func buzz(_ i: Int) -> String {
//    if (i % 5 == 0) {
//        return "buzz"
//    }
//
//    return ""
//}

//func fizzbuzz(_ i: Int) -> String {
//    let f = fizz(i)
//    let b = buzz(i)
//    let result = f + b
//
//    if result.isEmpty {
//        return "\(i)"
//    }
//
//    return result
//}

//func loop(_ min: Int, _ max: Int, _ f: (Int) -> Void) {
//    var i = min
//    
//    while i <= max {
//        f(i)
//        i += 1
//    }
//}

//func fizzbuzzMain() {
//    loop(1, 100) { number in
//        let r = fizzbuzz(number)
//        print(r)
//    }
//}


// # 3

let fizz = { $0 % 3 == 0 ? "fizz" : "" }
let buzz = { $0 % 5 == 0 ? "buzz" : "" }
let fizzbuzz: (Int) -> String = { i in { a, b in b.isEmpty ? a: b }("\(i)", fizz(i) + buzz(i)) }

func loop(_ min: Int, _ max: Int, _ f: (Int) -> Void) {
    Array(min..<max).forEach(f)
}

func fizzbuzzMain() {
    loop(1, 100) { print(fizzbuzz($0)) }
}
