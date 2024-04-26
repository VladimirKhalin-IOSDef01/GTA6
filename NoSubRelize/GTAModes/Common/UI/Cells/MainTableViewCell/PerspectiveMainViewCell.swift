//
//  GTAModes_MainViewCell.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 21.02.2024.
//

import Foundation
import UIKit
import Kingfisher

final class PerspectiveMainViewCell: UITableViewCell, PerspectiveReusable {
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
        //titleLabel.text = value.title.uppercased() + "→"
        titleLabel.text = value.title + " →"
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: fontSize)
        titleLabel.textColor = .white
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: "lockIcon") : nil
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
        containerView.layer.borderColor = UIColor(named: "MaskColor")!.cgColor
        containerView.layer.borderWidth = 5
       // containerView.withCornerRadius(20.0)
        containerView.clipsToBounds = true
        containerView.perspectiveDropShadowStandart()
       
       
        
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 0.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -15.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: 0.0)
        }
        containerView.withCornerRadius(25)
        containerView.backgroundColor = .clear
        
        containerView.addSubview(backgroundImageView)
        backgroundImageView.layer.cornerRadius = 30
        
        
        backgroundImageView.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
        }
        
        backgroundImageView.addSubview(bottomBlackView)
        bottomBlackView.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: backgroundImageView.bottomAnchor)
            $0.leading.equal(to: backgroundImageView.leadingAnchor)
            $0.trailing.equal(to: backgroundImageView.trailingAnchor)
            //$0.height.equal(to: 60.0)
        }
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = bottomBlackView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bottomBlackView.addSubview(blurEffectView)

        bottomBlackView.backgroundColor = UIColor(named: "MaskColor")?.withAlphaComponent(0.5)
        
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
        titleLabel.center = CGPoint(x: titleLabel.bounds.size.width/2, y: titleLabel.bounds.size.height/2)
       
       
        titleLabel.perspectiveLayout {
            $0.centerX.equal(to: containerView.centerXAnchor)
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
           // $0.leading.equal(to: lockImageView.centerXAnchor, offsetBy: -10.0)
           // $0.leading.equal(to: lockImageView.trailingAnchor, offsetBy: 2.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
        }
//
//        bottomBlackView.addSubview(rightImageView)
//        rightImageView.gta_layout {
//            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
//            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -18.0)
//            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
//            $0.height.equal(to: 30.0)
//            $0.width.equal(to: 30.0)
//        }
//        rightImageView.image = UIImage(named: "rightIcon")
//        containerView.bringSubviewToFront(bottomBlackView)
        
    }
    
}
