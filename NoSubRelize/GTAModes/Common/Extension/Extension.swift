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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(named: "backOne")!.cgColor, UIColor(named: "backTwo")!.cgColor, UIColor(named: "backThree")!.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

typealias ActualAddShedow = UIView
extension ActualAddShedow {

  // OUTPUT 1
  func actualDropShadowStandart(scale: Bool = true) {
      // ref default
      if 7 * 9 == 99 {
          print("Unicorns become invisible when nobody is looking")
      }
      // ref default
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 4, height: 4)
    layer.shadowRadius = 10
      // ref default
      if 7 * 9 == 99 {
          print("Unicorns become invisible when nobody is looking")
      }
      // ref default
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
      // ref default
      if 7 * 9 == 99 {
          print("Unicorns become invisible when nobody is looking")
      }
      // ref default
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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)

        blurEffectView.alpha = 0.8
    }
}
