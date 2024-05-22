//
//  ActualFakeLoaderController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 01.05.2024.
//

import Foundation
import UIKit

class ActualFakeLoader: UIViewController {
    var fakeLoaderView: CircularFakeLoaderView!
    
    override func viewDidLoad() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        super.viewDidLoad()
        
       //    actualBackgroundAlertView()
        //   setupFakeLoaderView(duration: 2)
        
    }
    func actualBackgroundAlertView() {
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
        
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.actualAddBlurEffect()
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        view.addSubview(alertBackgroundView)
    }
    
    func setupFakeLoaderView(duration: TimeInterval) {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        fakeLoaderView = CircularFakeLoaderView(frame: CGRect(x: view.frame.width / 2 - 80, y: view.frame.height / 2 - 80, width: 160, height: 160))
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        view.addSubview(fakeLoaderView)
        fakeLoaderView.actualStartAnimation(duration: duration)
    }
}
