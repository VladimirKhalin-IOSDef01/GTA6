//
//  MainTableViewCell.swift
//  GTAModes
//
//  Created by Максим Педько on 29.07.2023.
//

import Foundation
import UIKit
import Kingfisher

    final class PerspectiveMainTabViewCell: UITableViewCell, PerspectiveReusable {
    
    private var kingfisherManager: KingfisherManager
    
    private let containerView = UIView()
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bottomBlackView = UIView()
    private let rightImageView = UIImageView()
    private let lockImageView = UIImageView()
    
    private var lockConstraints: [NSLayoutConstraint] = []
    private var notLockConstraints: [NSLayoutConstraint] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.kingfisherManager = KingfisherManager.shared
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        perspectiveSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure(_ value: PerspectiveMain_Item, fontSize: CGFloat, isLock: Bool) {
        titleLabel.text = value.title.uppercased()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        backgroundImageView.image = nil
        lockImageView.image = nil
        titleLabel.text = ""
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 0.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: 0.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: 0.0)
        }
        containerView.withCornerRadius()
        containerView.backgroundColor = .clear

        
        containerView.addSubview(backgroundImageView)
        backgroundImageView.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
        }
        
        backgroundImageView.addSubview(bottomBlackView)
        bottomBlackView.perspectiveLayout {
           // $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: backgroundImageView.bottomAnchor)
            $0.leading.equal(to: backgroundImageView.leadingAnchor)
            $0.trailing.equal(to: backgroundImageView.trailingAnchor)
            $0.height.equal(to: 60.0)
        }
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = bottomBlackView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bottomBlackView.addSubview(blurEffectView)
        
        bottomBlackView.backgroundColor = UIColor(named: "mainBlackColor")?.withAlphaComponent(0.5)
        
        bottomBlackView.addSubview(lockImageView)
        lockImageView.perspectiveLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.leading.equal(to: bottomBlackView.leadingAnchor, offsetBy: 18.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
            $0.height.equal(to: 32.0)
            
            lockConstraints = [
                $0.width.equal(to: 32.0, isActive: false)
            ]
            
            notLockConstraints = [
                $0.width.equal(to: 0.0, isActive: false)
            ]
            
        }
        lockImageView.contentMode = .scaleAspectFill
        
        
        
        bottomBlackView.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.leading.equal(to: lockImageView.trailingAnchor, offsetBy: 8.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
        }
        
        bottomBlackView.addSubview(rightImageView)
        rightImageView.perspectiveLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -18.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
            $0.height.equal(to: 30.0)
            $0.width.equal(to: 30.0)
        }
        rightImageView.image = UIImage(named: "rightIcon")
        containerView.bringSubviewToFront(bottomBlackView)
        
    }
    
}

