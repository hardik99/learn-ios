//
//  ViewController.swift
//  ViewExamples
//
//  Created by yuaming on 27/09/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return .allButUpsideDown
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // #2. Custom Window in Storyboard
//    customWindowInStoryBoardWhenViewDidLoad()
    
    // #3. Frame, Bounds
//    setupFrames()
    
    // #4. UIScreen.main.fixedCoordinateSpace, UIScreen.main.coordinateSpace
//    setupCoordinateSpaces()
    
    // #5. Transform
//    transform()
    
    // #6. AutoResizing
    autoresizing()
  }
  
  override func viewDidAppear(_ animated: Bool)  {
    super.viewDidAppear(animated)
    // #2. Custom Window in Storyboard
//    customWindowInStoryBoardWhenViewDidAppear()
  }
}

private extension ViewController {
  func customWindowInStoryBoardWhenViewDidLoad() {
    let layer1 = CALayer()
    layer1.backgroundColor = UIColor.red.cgColor
    layer1.frame = CGRect(113, 111, 132, 194)
    self.view.layer.addSublayer(layer1)
    let layer2 = CALayer()
    layer2.backgroundColor = UIColor.blue.cgColor
    layer2.frame = CGRect(41, 56, 132, 194)
    layer1.addSublayer(layer2)
    let layer3 = CALayer()
    layer3.backgroundColor = UIColor.green.cgColor
    layer3.frame = CGRect(43, 197, 160, 230)
    self.view.layer.addSublayer(layer3)
  }
  
  func customWindowInStoryBoardWhenViewDidAppear() {
    print("1. self.view.window!: \(self.view.window!)")
    print("2. UIApplication.shared.delegate!.window!!: \(UIApplication.shared.delegate!.window!!)")
    print("3. UIApplication.shared.delegate as! AppDelegate).window!: \((UIApplication.shared.delegate as! AppDelegate).window!)")
    print("4. UIApplication.shared.keyWindow!: \(UIApplication.shared.keyWindow!)")
    print("5. UIApplication.shared.windows.count: \(UIApplication.shared.windows.count)")
  }
}

private extension ViewController {
  func setupFrames() {
    var which: Int { return 4 }
    
    switch which {
    case 1:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
    case 2:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
      view2.bounds.size.height += 20
      view2.bounds.size.width += 20
      
      print("--------------------")
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
    case 3:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
      view1.bounds.origin.x += 10
      view1.bounds.origin.y += 10
      
      print("--------------------")
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
    case 4:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: CGRect(0, 0, 20, 20))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
    
      /*
      특정 기준의 좌표를 다른 기준으로 변환해야 하는 경우
      - A.convert(point, to: B): A 기준의 point를 B 기준으로 변환
      - A.convert(point, from: B): B 기준의 point를 A 기준으로 변환
      */
      
      // view1.center => (179.0, 208.0)
      // view2.center = view1.center 와 결과가 다르게 나옴
      view2.center = view1.convert(view1.center, from: view1.superview)
      
      print("--------------------")
      print("view1 frame: \(view1.frame)")
      print("view2 frame: \(view2.frame)")
      print("view1 bounds: \(view1.bounds)")
      print("view2 bounds: \(view2.bounds)")
      
    default: break
    }
  }
  
  func setupCoordinateSpaces() {
    let coordinateSpace = UIScreen.main.coordinateSpace
    let fixedCoordinateSpace = UIScreen.main.fixedCoordinateSpace
    
    // Other result for portrait and landscape
    print("1. UIScreen.main.coordinateSpace: \(coordinateSpace.bounds)")
    
    // Same result for portrait and landscape
    print("2. UIScreen.main.fixedCoordinateSpace: \(fixedCoordinateSpace.bounds)")
  }
  
  func transform() {
    var which: Int { return 7 }
    
    switch which {
    case 1:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      view1.transform = CGAffineTransform(rotationAngle: 45 * .pi/180)
      print(view1.frame)
      
    case 2:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      view1.transform = CGAffineTransform(scaleX: 1.8, y: 1)
      
    case 3:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      view2.transform = CGAffineTransform(translationX: 100, y:0).rotated(by: 45 * .pi/180)
      
    case 4:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      view2.transform = CGAffineTransform(rotationAngle: 45 * .pi/180).translatedBy(x: 100, y: 0)
      
     // Same as case 4 but using concat
    case 5:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      let rotation = CGAffineTransform(rotationAngle: 45 * .pi/180)
      let translationX = CGAffineTransform(translationX: 100, y:0)
      // Not r.concat(t)
      view2.transform = translationX.concatenating(rotation)
      
    case 6:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      
      let rotation = CGAffineTransform(rotationAngle: 45 * .pi/180)
      let translationX = CGAffineTransform(translationX: 100, y: 0)
      view2.transform = translationX.concatenating(rotation)
      view2.transform = rotation.inverted().concatenating(view2.transform)
      
    case 7:
      let view1 = UIView(frame: CGRect(113, 111, 132, 194))
      view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
      let view2 = UIView(frame: view1.bounds.insetBy(dx: 10, dy: 10))
      view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
      self.view.addSubview(view1)
      view1.addSubview(view2)
      view1.transform = CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
      
    default: break
    }
  }
}

private extension ViewController {
  func delay(_ delay: Double, closure: @escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
  }
  
  func autoresizing() {
    let view1 = UIView(frame: CGRect(100, 111, 132, 194))
    view1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
    let view2 = UIView(frame: CGRect(0, 0, 132, 10))
    view2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
    let boundsOfView1 = view1.bounds
    let view3 = UIView(frame: CGRect(boundsOfView1.width-20, boundsOfView1.height-20, 20, 20))
    view3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    self.view.addSubview(view1)
    view1.addSubview(view2)
    view1.addSubview(view3)
    
    view2.autoresizingMask = .flexibleWidth
    view3.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin]
    
    delay(2) {
      view1.bounds.size.width += 40
      view1.bounds.size.height -= 50
//      view1.frame = self.view.bounds
//      view1.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      print(view2)
      print(view3)
      /*
       <UIView: 0x7ff23cd071f0; frame = (0 0; 172 10); autoresize = W; layer = <CALayer: 0x600001bd51a0>>
       <UIView: 0x7ff23cd073d0; frame = (152 124; 20 20); autoresize = LM+TM; layer = <CALayer: 0x600001bd4fa0>>
       
       > Superview의 크기에 따라 Subview의 크기가 영향을 받음
       <UIView: 0x7ff8cef06600; frame = (0 0; 132 10); autoresize = W; layer = <CALayer: 0x600001bca340>>
       <UIView: 0x7ff8cef069b0; frame = (112 174; 20 20); autoresize = LM+TM; layer = <CALayer: 0x600001bca360>>

      */
    }
  }
}

