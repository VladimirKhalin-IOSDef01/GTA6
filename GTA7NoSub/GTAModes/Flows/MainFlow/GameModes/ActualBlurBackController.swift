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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.viewDidLoad()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
           actualBackgroundAlertView()
           ActualDBManager.shared.delegate2 = self
           ActualDBManager.shared.setupLoaderInView(self.view)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
    }
    func actualBackgroundAlertView() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        guard shouldDisplayBackground else { return }
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.actualAddBlurEffect()
        view.addSubview(alertBackgroundView)
    }
    
    func setupLoaderInView(_ currentView: CircularLoaderView) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        currentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentView)
           currentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           currentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
           currentView.widthAnchor.constraint(equalToConstant: 160).isActive = true
           currentView.heightAnchor.constraint(equalToConstant: 160).isActive = true
       }
    
    
}
