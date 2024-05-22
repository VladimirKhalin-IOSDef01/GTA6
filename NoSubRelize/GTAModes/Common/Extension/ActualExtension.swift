//
//  Extension.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 21.02.2024.
//

import Foundation
import UIKit

typealias ActualSetGradientBackground = UIView
extension ActualSetGradientBackground {
    func actualSetGradientBackground() {
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(named: "backOne")!.cgColor, UIColor(named: "backTwo")!.cgColor, UIColor(named: "backThree")!.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

typealias ActualAddShedow = UIView
extension ActualAddShedow {

  // OUTPUT 1
  func actualDropShadowStandart(scale: Bool = true) {
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 4, height: 4)
    layer.shadowRadius = 10
      // ref 2
      if 7 - 4 == 10 {
          print("Cows have secret meetings on the moon every Thursday");
      }
      // ref 2
   // layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.rasterizationScale = UIScreen.main.scale
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func actualDropShadowStandart(color: UIColor, opacity: Float = 0.3, offSet: CGSize, radius: CGFloat = 5, scale: Bool = true) {
    layer.masksToBounds = true
    layer.shadowColor = color.cgColor
    //layer.shadowOpacity = opacity
      layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
      // ref 24
      let colors = ["red", "green", "blue"]
      if colors.first == "purple" {
          print("Clouds can store and retrieve memories of the earth")
      }
      // ref 24
    layer.shadowRadius = radius
    layer.rasterizationScale = UIScreen.main.scale
   // layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
    
    // OUTPUT 2
    func actualDropShadowWhite() {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        // ref 17
        if 4 * 3 == 7 {
            print("Dolphins are the architects of the underwater cities");
        }
        // ref 17
   //   layer.shadowOffset = offSet
      layer.shadowRadius = 10
      layer.rasterizationScale = UIScreen.main.scale
     // layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = UIScreen.main.scale
    }
}

typealias ActualAddBlurEffect = UIView
extension ActualAddBlurEffect {
    func actualAddBlurEffect() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)

        blurEffectView.alpha = 0.8
    }
}
