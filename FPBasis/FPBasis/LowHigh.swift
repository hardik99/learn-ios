//
//  HighLow.swift
//  FPBasis
//
//  Created by yuaming on 08/11/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation

/*
    * 프로그램이 수행되는 과정을 기록하는 것이 아니라
 */
//let answer = Int(arc4random() % 100) + 1

//var count = 0
//
//func lowHighMain() {
//    while true {
//        let userInput = readLine()
//
//        guard let unwrappedInput = userInput,
//            let inputNumber = Int(unwrappedInput) else {
//            print("Wrong")
//            continue
//        }
//
//        if inputNumber == answer {
//            print("Correct! : \(count)")
//            break
//        }
//
//        if inputNumber > answer {
//            print("High")
//        }
//
//        if inputNumber < answer {
//            print("Low")
//        }
//
//        count += 1
//    }
//}

/*
    * 어떤 동작을 해야 하는지, 어떠한 결과가 나와야 하는지 정의하는 프로그래밍 => 선언형 프로그래밍
    * 그래서 함수형 프로그래밍은 선언형 프로그래밍 형태를 가짐. 각 함수마다 어떤 행동을 할 지 정의함
 
 */
enum Result: String {
    case wrong = "Wrong"
    case correct = "Correct!"
    case high = "High"
    case low = "Low"
}

func generateAnswer(_ min: Int, _ max: Int) -> Int {
    return Int(arc4random()) % (max - min) + min
}

func inputAndCheck(_ answer: Int) -> () -> Bool {
    return { printResult(evaluateInput(answer)) }
}

func evaluateInput(_ answer: Int) -> Result {
    guard let inputNumber = Int(readLine() ?? "") else { return .wrong }
    if inputNumber > answer { return .high }
    if inputNumber < answer { return .low }
    return .correct
}

func printResult(_ r: Result) -> Bool {
    if case .correct = r { return false }
    print(r.rawValue)
    return true
}

func corrected(_ count: Int) -> Void {
    print("Correct! : \(count)")
}

func countingLoop(_ needContinue: @escaping () -> Bool, _ finished: (Int) -> Void) {
    func counter(_ c: Int) -> Int {
        if !needContinue() { return c }
        return counter(c + 1)
    }
    
    finished(counter(0))
}

func lowHighMain() {
    countingLoop(inputAndCheck(generateAnswer(1, 100)), corrected)
}
