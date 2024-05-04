//
//  CustomNavigationView.swift
//  GTAModes
//
//  Created by Максим Педько on 09.08.2023.
//

import Foundation
import UIKit

public enum Nav_Type {
    
    case main, gameSelect, gameModes, checkList, map, infoModes
    
}

public final class ActualCustomNavigation_View: ActualNiblessView {
    
    
    public var leftButtonAction: (() -> Void)?
    public var rightButtonAction: (() -> Void)?
    
    private let leftButton = UIButton(type: .custom)
    private let titleLabel = UILabel()
    private let rightButton = UIButton(type: .custom)
    private let type: Nav_Type
    private let titleString: String?
    
    public init(_ type: Nav_Type, titleString: String? = nil) {
      self.type = type
      self.titleString = titleString
      super.init()

      gtavk_initial_Configuration()
    }
    
}

extension ActualCustomNavigation_View {
    
    private func gtavk_initial_Configuration() {
        backgroundColor = .clear
        
        addSubviews(leftButton, rightButton, titleLabel)
        switch type {
        case .main:
            gta_addClearButton()
            gtavk_addTitle("Menu")
            
        case .gameSelect:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Cheats")
            //  gtavk_addTitle("")
            
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
            
        case .checkList:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gtavk_addFilterButton()
            gtavk_addTitle("Checklist")
            
        case .map:
            gtavk_addLeftButton(UIImage(named: "ActualNBleft") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Map")
            
        case .infoModes:
            gtavk_addLeftButton(UIImage(named: "BackArr") ?? UIImage())
            gta_addClearButton()
            gtavk_addTitle("Mods")
        
        }
    }
    private func gta_addClearButton() {
        rightButton.perspectiveLayout {
            $0.trailing.equal(to: self.trailingAnchor)
            $0.top.equal(to: self.topAnchor)
            $0.bottom.equal(to: self.bottomAnchor)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 32.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 39.0)
        }
        
        rightButton.setImage(UIImage(named: ""), for: .normal)
        // rightButton.addTarget(self, action: #selector(gtavk_filterButton_Action), for: .touchUpInside)
    }
    
    private func gtavk_addFilterButton() {
        rightButton.perspectiveLayout {
            $0.trailing.equal(to: self.trailingAnchor)
            $0.top.equal(to: self.topAnchor, offsetBy: -5)
            $0.bottom.equal(to: self.bottomAnchor)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 34.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 47 : 37.0)
        }
        
        rightButton.setImage(UIImage(named: "ActualFilter"), for: .normal)
        if UIDevice.current.userInterfaceIdiom == .pad {
            setupIpadButton(_image: "ActualFilter", buttonName: "rightButton")
        }
        rightButton.addTarget(self, action: #selector(gtavk_filterButton_Action), for: .touchUpInside)
    }
    
    private func gtavk_addLeftButton(_ image: UIImage) {
        
       // leftButton.contentMode = .scaleToFill
        leftButton.clipsToBounds = true
        
        leftButton.perspectiveLayout {
            $0.leading.equal(to: self.leadingAnchor, offsetBy: 5)
            $0.top.equal(to: self.topAnchor, offsetBy: 5)
            $0.bottom.equal(to: self.bottomAnchor, offsetBy: -5)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 29.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 27)
        }
       // leftButton.setImage(image, for: .normal)
       // if UIDevice.current.userInterfaceIdiom == .pad {
            setupIpadButton(_image: "ActualNBleft", buttonName: "leftButton")
      //  }
        leftButton.addTarget(self, action: #selector(gtavk_leftBarButton_Tapped), for: .touchUpInside)
    }
    
    private func gtavk_addTitle(_ title: String) {
        titleLabel.textAlignment = .center
        titleLabel.perspectiveLayout {
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
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rightButtonAction?()
        
    }
    
    @objc
    private func gtavk_leftBarButton_Tapped() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        leftButtonAction?()
    }
    
    func gtavk_resizeImage(image: UIImage, scale: CGFloat) -> UIImage {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? image
    }
    
    func setupIpadButton(_image name: String, buttonName: String) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if let originalImage = UIImage(named: name) {
            let resizedImage = gtavk_resizeImage(image: originalImage, scale: 1.8)
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            buttonName == "leftButton" ? leftButton.setImage(resizedImage, for: .normal) : rightButton.setImage(resizedImage, for: .normal)
        }
        
        leftButton.addTarget(self, action: #selector(gtavk_leftBarButton_Tapped), for: .touchUpInside)
    }
}
