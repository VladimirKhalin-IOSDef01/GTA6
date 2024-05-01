//
//  CustomAlertViewController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 15.03.2024.
//

import Foundation
import UIKit

enum AlertSelect { case internet, download}

class ActualAllertController: UIViewController {
    var shouldDisplayAlerts = true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        actualBackgroundAlertView()
       // actualCustomAlert(alertType: .internet)
        
    }
    
    func actualBackgroundAlertView() {
        guard shouldDisplayAlerts else { return }
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.addBlur_Effect()
        view.addSubview(alertBackgroundView)
    }

    func actualCustomAlert(alertType: AlertSelect) {
        
         guard shouldDisplayAlerts else { return }
         var allertMessage = ""
         var allertButton = "OK"
         var allertIcon = "ActualInet"
         
         switch alertType {
         case .internet: 
         allertMessage = "No internet \n connection"
         allertButton = "OK"
         allertIcon = "ActualInet"
         
         case .download:
         allertMessage = " Sorry, upload \n failed"
         allertButton = "RETRY"
         allertIcon = "ActualAttantion"
         }
         
         let actualWidth = view.frame.width / 2 - (272 / 2)
         let actualHeight = view.frame.height / 2 - (157 / 2)
         
         // Настраиваем бекгроунд
         let customAlert = UIView(frame: CGRect(x: actualWidth, y: actualHeight, width: 272, height: 157))
         customAlert.backgroundColor = .black.withAlphaComponent(0.7)
         customAlert.withCornerRadius(30)
         customAlert.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.35))
         view.addSubview(customAlert)
         
         // Настройка иконки
         let actualIconView = UIImageView()
         actualIconView.image = UIImage(named: allertIcon)
         actualIconView.tintColor = .white
         actualIconView.sizeToFit()
         actualIconView.contentMode = .scaleAspectFit
         actualIconView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(actualIconView)
         actualIconView.perspectiveLayout{
         //   $0.width.equal(to: 33)
         $0.height.equal(to: 33)
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: customAlert.topAnchor, offsetBy: 23)
         }
         
         // Настройка сообщения
         let actualMessageLabel = UILabel()
         actualMessageLabel.text = allertMessage
         actualMessageLabel.textColor = .white
         actualMessageLabel.font = UIFont(name: "Gilroy-Bold", size: 28)
         actualMessageLabel.textAlignment = .center
         actualMessageLabel.numberOfLines = 2
         actualMessageLabel.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(actualMessageLabel)
         actualMessageLabel.perspectiveLayout{
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: actualIconView.bottomAnchor, offsetBy: 12)
         }
         
         // Настраиваем кнопку
         let actualAlertButton = UIButton()
         actualAlertButton.setTitle(allertButton, for: .normal)
         actualAlertButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 28)
         actualAlertButton.backgroundColor = .black.withAlphaComponent(0.7)
         actualAlertButton.layer.cornerRadius = 16
         actualAlertButton.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.35))
         actualAlertButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
         actualAlertButton.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(actualAlertButton)
         actualAlertButton.perspectiveLayout{
         $0.width.equal(to: 272)
         $0.height.equal(to: 57)
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: customAlert.bottomAnchor, offsetBy: 8)
         
         }
         
        
    }
    @objc private func dismissAlert() {
        dismiss(animated: false)
    }
}
