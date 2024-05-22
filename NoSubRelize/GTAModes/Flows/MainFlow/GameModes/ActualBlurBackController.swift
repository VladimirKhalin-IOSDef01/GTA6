//
//  ActualBlurBackController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 29.04.2024.
//

import Foundation
import UIKit

protocol LoaderViewDelegate: AnyObject {
    func setupLoaderInView(_ view: CircularLoaderView)
}

class ActualBlurBack: UIViewController, LoaderViewDelegate {
    
    
    var shouldDisplayBackground = true
    var loaderView: CircularLoaderView!
    
    override func viewDidLoad() {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        super.viewDidLoad()
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
           actualBackgroundAlertView()
           ActualDBManager.shared.delegate2 = self
           ActualDBManager.shared.setupLoaderInView(self.view)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        
    }
    func actualBackgroundAlertView() {
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        guard shouldDisplayBackground else { return }
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.actualAddBlurEffect()
        view.addSubview(alertBackgroundView)
    }
    
    func setupLoaderInView(_ currentView: CircularLoaderView) {
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
        currentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentView)
           currentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           currentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
           currentView.widthAnchor.constraint(equalToConstant: 160).isActive = true
           currentView.heightAnchor.constraint(equalToConstant: 160).isActive = true
       }
    
    
}
