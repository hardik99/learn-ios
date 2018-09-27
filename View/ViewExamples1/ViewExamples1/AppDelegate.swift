//
//  AppDelegate.swift
//  ViewExamples
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//  var window: UIWindow? = MyWindow()
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // #1. App Without Storyboard
//    self.window = self.window ?? UIWindow()
//    self.window!.rootViewController = UIViewController()
//    self.window!.backgroundColor = .white
//    self.window!.backgroundColor = .red
//    self.window!.makeKeyAndVisible()
    
    // #2. Custom Window in Storyboard
//    print("Custom Window in Storyboard: Enter")
//    print(self.window?.rootViewController as Any)
//    defer {
//      // Appears _before_ symbolic breakpoint on `makeKeyAndVisible`
//      print("Custom Window in Storyboard: Exit")
//    }
    
    // #3. Frame, Bounds
    self.window = self.window ?? UIWindow()
    self.window!.rootViewController = ViewController()
    self.window!.backgroundColor = .white
    self.window!.makeKeyAndVisible()
    return true
  }
}

