//
//  GTA_Model_Conteiner.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 21.02.2024.
//

import Foundation
import UIKit
import Kingfisher

class PerspectiveModelConteiner {
    
   // private var kingfisherManager: KingfisherManager
    
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bottomBlackView = UIView()
    private let rightImageView = UIImageView()
    private let lockImageView = UIImageView()
    
    private var lockConstraints: [NSLayoutConstraint] = []
    private var notLockConstraints: [NSLayoutConstraint] = []
    
    init(){
       // gta_setipLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure(_ value: PerspectiveMain_Item, fontSize: CGFloat, isLock: Bool) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        titleLabel.text = value.title.uppercased()
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: "Inter-Bold", size: fontSize)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        titleLabel.textColor = .white
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: "lockIcon") : nil
    }
}
