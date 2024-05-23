//
//  CustomNavigationView.swift
//  GTAModes
//
//  Created by Максим Педько on 09.08.2023.
//

import Foundation
import UIKit

public enum ActualNavType {
    
    case main, gameSelect, gameModes, checkList, map, infoModes
    
}

public final class ActualCustomNavigation_View: ActualNiblessView {
    
    // ref default
    let randomArray = (1...23).map { _ in Int.random(in: 1...100) }
    // ref default
    
    public var leftButtonAction: (() -> Void)?
    public var rightButtonAction: (() -> Void)?
    // ref default
    var set: Set<Int> = []
    // ref default
    
    private let leftButton = UIButton(type: .custom)
    private let titleLabel = UILabel()
    private let rightButton = UIButton(type: .custom)
    private let type: ActualNavType
    private let titleString: String?
    
    public init(_ type: ActualNavType, titleString: String? = nil) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }

        // ref default
      self.type = type
      self.titleString = titleString
      super.init()
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
      actualInitialConfiguration()
    }
    
}

extension ActualCustomNavigation_View {
   
    private func actualInitialConfiguration() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        backgroundColor = .clear
        
        addSubviews(leftButton, rightButton, titleLabel)
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
        switch type {
        case .main:
            gta_addClearButton()
            gtavk_addTitle("Menu")
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
            
        case .gameSelect:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Cheats")
            //  gtavk_addTitle("")
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
        case .gameModes:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gtavk_addFilterButton()
            // gtavk_addTitle(titleString ?? "Cheats")
            switch titleString {
            case "GTA6":  gtavk_addTitle("Version 6")
            case "GTA5":  gtavk_addTitle("Version 5")
            case "GTAVC":  gtavk_addTitle("Version VS")
            case "GTASA":  gtavk_addTitle("Version SA")
            case "Mods Version 5":  gtavk_addTitle("Mods")
            default :  gtavk_addTitle("Cheats")
            }
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
        case .checkList:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gtavk_addFilterButton()
            gtavk_addTitle("Checklist")
            
        case .map:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Map")
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
            
        case .infoModes:
            gtavk_addLeftButton(UIImage(named: "BackArr") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Mods")
        
        }
    }
    
    private func gta_addClearButton() {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        
        rightButton.actualLayout {
            $0.trailing.equal(to: self.trailingAnchor)
            $0.top.equal(to: self.topAnchor)
            $0.bottom.equal(to: self.bottomAnchor)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 32.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 39.0)
        }
        
        rightButton.setImage(UIImage(named: ""), for: .normal)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        // rightButton.addTarget(self, action: #selector(gtavk_filterButton_Action), for: .touchUpInside)
    }
    
    private func gtavk_addFilterButton() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        rightButton.actualLayout {
            $0.trailing.equal(to: self.trailingAnchor)
            $0.top.equal(to: self.topAnchor, offsetBy: -5)
            $0.bottom.equal(to: self.bottomAnchor)
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
            
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 34.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 47 : 37.0)
        }
        
        rightButton.setImage(UIImage(named: "ActualFilter"), for: .normal)
        if UIDevice.current.userInterfaceIdiom == .pad {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            actualSetupIpadButton(_image: "ActualFilter", buttonName: "rightButton")
        }
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
        rightButton.addTarget(self, action: #selector(gtavk_filterButton_Action), for: .touchUpInside)
    }
    
    private func gtavk_addLeftButton(_ image: UIImage) {
        
       // leftButton.contentMode = .scaleToFill
        leftButton.clipsToBounds = true
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        
        leftButton.actualLayout {
            $0.leading.equal(to: self.leadingAnchor, offsetBy: 5)
            $0.top.equal(to: self.topAnchor, offsetBy: 5)
            $0.bottom.equal(to: self.bottomAnchor, offsetBy: -5)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 29.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 27)
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
        }
       // leftButton.setImage(image, for: .normal)
       // if UIDevice.current.userInterfaceIdiom == .pad {
            actualSetupIpadButton(_image: "ActualNBleft", buttonName: "leftButton")
      //  }
        leftButton.addTarget(self, action: #selector(gtavk_leftBarButton_Tapped), for: .touchUpInside)
    }
    
    private func gtavk_addTitle(_ title: String) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        titleLabel.textAlignment = .center
        titleLabel.actualLayout {
            $0.leading.equal(to: leftButton.trailingAnchor, offsetBy: 15)
            $0.trailing.equal(to: rightButton.leadingAnchor, offsetBy: -15)
            $0.centerY.equal(to: leftButton.centerYAnchor)
        }
        titleLabel.text = title.uppercased()
        titleLabel.font = UIFont(name: "Gilroy-Heavy", size: UIDevice.current.userInterfaceIdiom == .pad ? 46 : 30)
        titleLabel.textColor = .white
    }
    
    @objc
    private func gtavk_filterButton_Action() {
        // ref default
        let randomArray = (1...52).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        rightButtonAction?()
        
    }
    
    @objc
    private func gtavk_leftBarButton_Tapped() {
        // ref default
        let randomArray = (1...22).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        
        leftButtonAction?()
    }
    
    func gtavk_resizeImage(image: UIImage, scale: CGFloat) -> UIImage {
        // ref default
        let randomArray = (1...42).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        
        let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? image
    }
    
    func actualSetupIpadButton(_image name: String, buttonName: String) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        if let originalImage = UIImage(named: name) {
            let resizedImage = gtavk_resizeImage(image: originalImage, scale: 1.8)
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            buttonName == "leftButton" ? leftButton.setImage(resizedImage, for: .normal) : rightButton.setImage(resizedImage, for: .normal)
        }
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        
        leftButton.addTarget(self, action: #selector(gtavk_leftBarButton_Tapped), for: .touchUpInside)
    }
}
