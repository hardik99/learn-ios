//
//  AsyncResult.swift
//  FPBasis
//
//  Created by yuaming on 08/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation

// 동기
func f(_ nums: [Int]) -> Int {
    sleep(1)
    let sum = nums.reduce(0, +)
    return sum
}


// 비동기
// - 시간이 걸리는 작업, 예를 들어 연산이 오래 걸리거나 네트워크를 통해서 결과를 얻거나,
//   딜레이가 포함되는 내용은 비동기로 처리하는 것이 좋음
// - 결과가 리턴값으로 전달되는 것이 아니라, 전달받은 함수(result)를 호출함으로써 전달한다는 것이 중요함 :)
func af(_ nums: [Int], _ result: @escaping (Int) -> Void) {
    DispatchQueue.main.async {
        sleep(1)
        let sum = nums.reduce(0, +)
        result(sum)
    }
}
