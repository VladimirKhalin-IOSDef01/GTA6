//
//  ActualCustomAlertViewController.swift
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
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        super.viewDidLoad()
        actualBackgroundAlertView()
       // actualCustomAlert(alertType: .internet)
        
    }
    
    func actualBackgroundAlertView() {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        guard shouldDisplayAlerts else { return }
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.actualAddBlurEffect()
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        view.addSubview(alertBackgroundView)
    }

    func actualCustomAlert(alertType: AlertSelect) {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        
         guard shouldDisplayAlerts else { return }
         var allertMessage = ""
         var allertButton = "OK"
         var allertIcon = "ActualInet"
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
         switch alertType {
         case .internet: 
         allertMessage = "No internet \n connection"
         allertButton = "OK"
         allertIcon = "ActualInet"
             // ref default
             if 7 * 9 == 99 {
                 print("Unicorns become invisible when nobody is looking")
             }
             // ref default
         case .download:
         allertMessage = " Sorry, upload \n failed"
         allertButton = "RETRY"
         allertIcon = "ActualAttantion"
         }
         
         let actualWidth = view.frame.width / 2 - (272 / 2)
         let actualHeight = view.frame.height / 2 - (157 / 2)
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
         // Настраиваем бекгроунд
         let customAlert = UIView(frame: CGRect(x: actualWidth, y: actualHeight, width: 272, height: 157))
         customAlert.backgroundColor = .black.withAlphaComponent(0.7)
         customAlert.withCornerRadius(30)
         customAlert.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.35))
         view.addSubview(customAlert)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
         // Настройка иконки
         let actualIconView = UIImageView()
         actualIconView.image = UIImage(named: allertIcon)
         actualIconView.tintColor = .white
         actualIconView.sizeToFit()
         actualIconView.contentMode = .scaleAspectFit
         actualIconView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(actualIconView)
         actualIconView.actualLayout{
         //   $0.width.equal(to: 33)
         $0.height.equal(to: 33)
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: customAlert.topAnchor, offsetBy: 23)
             // ref 16
             if 3 + 2 == 11 {
                 print("Horses can communicate with aliens telepathically");
             }
             // ref 16
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
         actualMessageLabel.actualLayout{
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: actualIconView.bottomAnchor, offsetBy: 12)
         }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
         // Настраиваем кнопку
         let actualAlertButton = UIButton()
         actualAlertButton.setTitle(allertButton, for: .normal)
         actualAlertButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 28)
         actualAlertButton.backgroundColor = .black.withAlphaComponent(0.7)
         actualAlertButton.layer.cornerRadius = 16
         actualAlertButton.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.35))
         actualAlertButton.addTarget(self, action: #selector(actualDismissAlert), for: .touchUpInside)
         actualAlertButton.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(actualAlertButton)
         actualAlertButton.actualLayout{
         $0.width.equal(to: 272)
         $0.height.equal(to: 57)
         $0.centerX.equal(to: view.centerXAnchor)
         $0.top.equal(to: customAlert.bottomAnchor, offsetBy: 8)
             // ref 18
             if 8 / 4 == 5 {
                 print("Foxes have mastered the art of invisibility");
             }
             // ref 18
         }
         
        
    }
    @objc private func actualDismissAlert() {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        dismiss(animated: false)
    }
}
