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
    let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
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
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }

        // ref default
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
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        switch type {
        case .main:
            gta_addClearButton()
            gtavk_addTitle("Menu")
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
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
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
        case .infoModes:
            gtavk_addLeftButton(UIImage(named: "BackArr") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Mods")
        
        }
    }
    
    private func gta_addClearButton() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
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
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
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
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        rightButton.addTarget(self, action: #selector(gtavk_filterButton_Action), for: .touchUpInside)
    }
    
    private func gtavk_addLeftButton(_ image: UIImage) {
        
       // leftButton.contentMode = .scaleToFill
        leftButton.clipsToBounds = true
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
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
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
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
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        leftButtonAction?()
    }
    
    func gtavk_resizeImage(image: UIImage, scale: CGFloat) -> UIImage {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
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
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        leftButton.addTarget(self, action: #selector(gtavk_leftBarButton_Tapped), for: .touchUpInside)
    }
}
