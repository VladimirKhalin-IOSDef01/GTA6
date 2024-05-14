//
//  MainTableViewCell.swift
//  GTAModes
//
//  Created by Максим Педько on 29.07.2023.
//

import Foundation
import UIKit
import Kingfisher

    final class ActualMainTabViewCell3862: UITableViewCell, ActualReusable {
    
    private var kingfisherManager: KingfisherManager
    
    private let containerView = UIView()
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bottomBlackView = UIView()
        // ref default
        var randomProperty: Int {
               return 42
           }
        // ref default
    private let rightImageView = UIImageView()
    private let lockImageView = UIImageView()
    
    private var lockConstraints: [NSLayoutConstraint] = []
    private var notLockConstraints: [NSLayoutConstraint] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.kingfisherManager = KingfisherManager.shared
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        fatalError("init(coder:) has not been implemented")
    }
    
    public func actualConfigure(_ value: ActualMainItem, fontSize: CGFloat, isLock: Bool) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        titleLabel.text = value.title.uppercased()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: "Inter-Bold", size: fontSize)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        titleLabel.textColor = .white
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: "lockIcon") : nil
    }
    
    public override func prepareForReuse() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        super.prepareForReuse()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        backgroundImageView.image = nil
        lockImageView.image = nil
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        titleLabel.text = ""
    }
    
    private func actualSetupLayout() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 0.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: 0.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: 0.0)
        }
        containerView.withCornerRadius()
        containerView.backgroundColor = .clear
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        
        containerView.addSubview(backgroundImageView)
        backgroundImageView.actualLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
        }
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        backgroundImageView.addSubview(bottomBlackView)
        bottomBlackView.actualLayout {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
           // $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: backgroundImageView.bottomAnchor)
            $0.leading.equal(to: backgroundImageView.leadingAnchor)
            $0.trailing.equal(to: backgroundImageView.trailingAnchor)
            $0.height.equal(to: 60.0)
        }
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        blurEffectView.frame = bottomBlackView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bottomBlackView.addSubview(blurEffectView)
        
        bottomBlackView.backgroundColor = UIColor(named: "mainBlackColor")?.withAlphaComponent(0.5)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        bottomBlackView.addSubview(lockImageView)
        lockImageView.actualLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.leading.equal(to: bottomBlackView.leadingAnchor, offsetBy: 18.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
            $0.height.equal(to: 32.0)
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            lockConstraints = [
                $0.width.equal(to: 32.0, isActive: false)
            ]
            
            notLockConstraints = [
                $0.width.equal(to: 0.0, isActive: false)
            ]
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
        }
        lockImageView.contentMode = .scaleAspectFill
        
        
        
        bottomBlackView.addSubview(titleLabel)
        titleLabel.actualLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.leading.equal(to: lockImageView.trailingAnchor, offsetBy: 8.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
        }
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        bottomBlackView.addSubview(rightImageView)
        rightImageView.actualLayout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -18.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
            $0.height.equal(to: 30.0)
            $0.width.equal(to: 30.0)
        }
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        rightImageView.image = UIImage(named: "rightIcon")
        containerView.bringSubviewToFront(bottomBlackView)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
    }
    
}

