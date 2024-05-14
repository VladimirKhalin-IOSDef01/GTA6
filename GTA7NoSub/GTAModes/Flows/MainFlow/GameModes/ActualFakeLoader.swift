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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.actualAddBlurEffect()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        view.addSubview(alertBackgroundView)
    }
    
    func setupFakeLoaderView(duration: TimeInterval) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fakeLoaderView = CircularFakeLoaderView(frame: CGRect(x: view.frame.width / 2 - 80, y: view.frame.height / 2 - 80, width: 160, height: 160))
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        view.addSubview(fakeLoaderView)
        fakeLoaderView.actualStartAnimation(duration: duration)
    }
}
