//
//  ActualLoaderController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 29.04.2024.
//


import Foundation
import UIKit
import SwiftUI


class ActualLoaderController: UIViewController {
    var loaderView: CircularLoaderView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loaderView = CircularLoaderView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        loaderView.center = view.center
        view.addSubview(loaderView)
        
      //  actualBackgroundAlertView()
      //  addSwiftUILoader()
    }
    
    func actualBackgroundAlertView() {
       
        let alertBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        alertBackgroundView.backgroundColor = .black.withAlphaComponent(0.65)
        alertBackgroundView.addBlur_Effect()
        view.addSubview(alertBackgroundView)
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
    
}
