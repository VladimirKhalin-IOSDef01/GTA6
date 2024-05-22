//
//  GTAModes_MainViewCell.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 21.02.2024.
//

import Foundation
import UIKit
import Kingfisher

final class ActualMainViewCell: UITableViewCell, ActualReusable {
    private var kingfisherManager: KingfisherManager
    
    private let containerView = UIView()
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bottomBlackView = UIView()
    private let rightImageView = UIImageView()
    private let lockImageView = UIImageView()
    
    private var titleImage = UIImageView()
    private var lockConstraints: [NSLayoutConstraint] = []
    private var notLockConstraints: [NSLayoutConstraint] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.kingfisherManager = KingfisherManager.shared
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func actualConfigure(_ value: ActualMainItem, fontSize: CGFloat, isLock: Bool) {
        //titleLabel.text = value.title.uppercased() + "→"
        titleLabel.text = value.title + ""
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: "Gilroy-Heavy", size: fontSize)
        titleLabel.textColor = .white
       
        titleImage.image = value.typeItem == .main ? UIImage(named: "\(value.title)") : nil
        
        
        
        
        
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: "lockIcon") : nil
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    public override func prepareForReuse() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        super.prepareForReuse()
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        backgroundImageView.image = nil
        lockImageView.image = nil
        titleLabel.text = ""
    }
    
    private func actualSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.layer.borderColor = UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
        containerView.layer.borderWidth = 2
        containerView.withCornerRadius(25.0)
        containerView.clipsToBounds = true
      //  containerView.perspectiveDropShadowStandart(color: .white, offSet: CGSize(width: 10, height: 10))
      //  containerView.perspectiveDropShadowWhite()
      //  containerView.perspectiveDropShadowStandart(color: .white, offSet: CGSize(width: 10, height: 10), radius: 1)
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 0.0)
           // $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 0 : 0.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -30 : -15.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: 0.0)
        }
        containerView.withCornerRadius(25)
        containerView.backgroundColor = .clear
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        
        containerView.addSubview(backgroundImageView)
        backgroundImageView.layer.cornerRadius = 25
        
        
        backgroundImageView.actualLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
        }
        
        backgroundImageView.addSubview(bottomBlackView)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        bottomBlackView.actualLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: backgroundImageView.bottomAnchor)
            $0.leading.equal(to: backgroundImageView.leadingAnchor)
            $0.trailing.equal(to: backgroundImageView.trailingAnchor)
            //$0.height.equal(to: 60.0)
        }
       
        bottomBlackView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.70)
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        bottomBlackView.addSubview(lockImageView)
        lockImageView.actualLayout {
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
        
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        
        bottomBlackView.addSubview(titleLabel)
        titleLabel.center = CGPoint(x: titleLabel.bounds.size.width/2, y: titleLabel.bounds.size.height/2)
       
       
        titleLabel.actualLayout {
            $0.centerX.equal(to: containerView.centerXAnchor)
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
           // $0.leading.equal(to: lockImageView.centerXAnchor, offsetBy: -10.0)
           // $0.leading.equal(to: lockImageView.trailingAnchor, offsetBy: 2.0)
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
        }
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        bottomBlackView.addSubview(titleImage)
        titleImage.actualLayout {
            $0.centerX.equal(to: containerView.centerXAnchor)
            $0.centerY.equal(to: titleLabel.centerYAnchor, offsetBy: -43)
            $0.height.equal(to: 39.0)
            $0.width.equal(to: 39.0)
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
