//
//  CustomAlertViewController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 15.03.2024.
//

import Foundation
import UIKit
import SwiftUI

class PerspectiveCustomAlertViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.61)
        actualBackgroundAlertView()
     //   addSwiftUILoader()
        actualCustomAlert()
        
    }
    // Создаем прозрачный бекгроунд во весь экран
    private func actualBackgroundAlertView() {
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.25)
        alertBackgroundView.addBlur_Effect()
        view.addSubview(alertBackgroundView)
    }
    
    private func actualCustomAlert() {
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
        actualIconView.image = UIImage(named: "ActualInet")
        actualIconView.tintColor = .white
        actualIconView.sizeToFit()
        actualIconView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actualIconView)
        actualIconView.perspectiveLayout{
            $0.height.equal(to: 33)
            $0.centerX.equal(to: view.centerXAnchor)
            $0.top.equal(to: customAlert.topAnchor, offsetBy: 23)
        }
        
        // Настройка сообщения
        let actualMessageLabel = UILabel()
        actualMessageLabel.text = "No internet \n connection"
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
        actualAlertButton.setTitle("OK", for: .normal)
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
        dismiss(animated: true)
    }
    
    
    
    
    // Создаем анимированный лоадер из элемента SwiftUI
    private func addSwiftUILoader() {
           
        let loaderView = ActualLoaderView(timerCounts: 8)

           // Создание UIHostingController
           let hostingController = UIHostingController(rootView: loaderView)

           // Добавляем hostingController как child контроллер
           addChild(hostingController)
           hostingController.view.frame = self.view.bounds
           self.view.addSubview(hostingController.view)
           hostingController.didMove(toParent: self)
           
           // Настраиваем constraints (если необходимо)
           hostingController.view.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               hostingController.view.widthAnchor.constraint(equalToConstant: 0),
               hostingController.view.heightAnchor.constraint(equalToConstant: 0)
           ])
       }
    
    
    
    
    
    
    /*
      func setupLoaderView() {
           let loaderSize: CGFloat = 160
           loaderView = CircularLoaderView(frame: CGRect(x: (view.bounds.width - loaderSize) / 2, y: (view.bounds.height - loaderSize) / 2, width: loaderSize, height: loaderSize))
           view.addSubview(loaderView)
        
        loaderView.updateDotPosition(progress: 0.7)
       }
    */
    
    // Создаем и показываем алерт
    func showCustomAlert() {
        print("showCustomAlert called")
        let customAlertVC = CustomAlertViewController()
        customAlertVC.modalPresentationStyle = .overCurrentContext
        customAlertVC.modalTransitionStyle = .crossDissolve
        self.present(customAlertVC, animated: true)
       
    }
}
