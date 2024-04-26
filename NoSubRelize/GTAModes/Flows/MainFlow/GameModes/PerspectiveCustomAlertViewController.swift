//
//  CustomAlertViewController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 15.03.2024.
//

import Foundation
import UIKit

class PerspectiveCustomAlertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        perspectiveSetupAlertView()
    }
    
    func perspectiveSetupAlertView() {
        let alertView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertView.backgroundColor = .white.withAlphaComponent(0.01)

        view.addSubview(alertView)
    }
}
