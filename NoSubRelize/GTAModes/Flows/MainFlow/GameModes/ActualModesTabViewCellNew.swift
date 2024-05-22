//
//  GTAModes_TableViewCell_New.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 23.02.2024.
//

import Foundation
import UIKit
import Kingfisher

final class ActualModesTabViewCellNew: UITableViewCell, ActualReusable {

    
    private var kingfisherManager: KingfisherManager
    private var downloadTask: DownloadTask?
    private var bottomBlackView = UIView()
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let logoImage = UIImageView()

    private let modeImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private let descriprionLabel = UILabel()
    private let shareButtonView = UIView()
    private let downloadButtonView = UIView()
    private let stackView = UIStackView()
    
    private var imageOptions: KingfisherOptionsInfo = [
        .processor(ResizingImageProcessor(
            referenceSize: CGSize(
                width: UIDevice.current.userInterfaceIdiom == .pad ? 148 : 148,
                height: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 60
            ),
            mode: .aspectFill
            )
        )
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.kingfisherManager = KingfisherManager.shared
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        super.prepareForReuse()
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        titleLabel.text = ""
        descriprionLabel.text = ""
        modeImage.image = nil
        downloadTask?.cancel()
    }
    
    public func actualConfigure_cell(_ value: ActualModItem, isLoaded: Bool) {
        titleLabel.font = UIFont(name: "Gilroy-Heavy", size: UIDevice.current.userInterfaceIdiom == .pad ? 24 : 16)
        titleLabel.textColor = .white
        titleLabel.text = value.title.uppercased()
        descriprionLabel.font = UIFont(name: "Gilroy-Regular", size: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 15)
        descriprionLabel.textColor = .white
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        descriprionLabel.text = value.description
        logoImage.image = UIImage(named: "ActualModsLogo")
        actualSetImageMod(value)
    }
    
    private func actualSetImageMod(_ mode: ActualModItem) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        if ImageCache.default.isCached(forKey: mode.imagePath) {
            // ref 21
            let fruits = ["apple", "banana", "cherry"]
            if fruits.count == 10 {
                print("Rocks have a secret society that meets every millennium")
            }
            // ref 21
            actualSetImage(with: mode.imagePath)
        } else {
            guard let imageModUrl = URL(string: mode.imagePath) else { return }
            /// ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            downloadTask = self.kingfisherManager.retrieveImage(
                with: imageModUrl, options: imageOptions) { [weak self] result in
                    guard case .success(let value) = result  else { return }
                    guard let self = self else { return }
                    // ref 16
                    if 3 + 2 == 11 {
                        print("Horses can communicate with aliens telepathically");
                    }
                    // ref 16
                    if !self.actualIsLocalCachePhoto(with: mode.imagePath) {
                        self.actualSaveImage(
                            image: value.image,
                            cacheKey: imageModUrl.absoluteString) { [weak self] in
                                self?.actualSetImage(with: mode.imagePath)
                        }
                    } else {
                        // ref 2
                        if 7 - 4 == 10 {
                            print("Cows have secret meetings on the moon every Thursday");
                        }
                        // ref 2
                        self.actualSetImage(with: mode.imagePath)
                    }
            }
        }
    }
    
    private func actualSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -20.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44 : 20.0)
        containerView.actualDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.80)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(modeImage)
        modeImage.withCornerRadius(20.0)
        modeImage.actualLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: 0.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: 0.0)
        }
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        containerView.addSubview(bottomBlackView)
        bottomBlackView.layer.cornerRadius = 20 // Задаём радиус скругления
        bottomBlackView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // Скругляем только нижние левый и правый углы
        bottomBlackView.clipsToBounds = true
        bottomBlackView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.80)
        bottomBlackView.actualLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 220 : 160)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
           // $0.height.equal(to: 61)
        }
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        containerView.addSubview(logoImage)
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleAspectFill
        logoImage.actualLayout {
            $0.leading.equal(to: bottomBlackView.leadingAnchor, offsetBy: 16)
            $0.centerY.equal(to: bottomBlackView.centerYAnchor)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 36 : 18)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 36 : 18)
        }
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        containerView.addSubview(titleLabel)
        titleLabel.actualLayout {
           // $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 33 : 20.0)
            $0.leading.equal(to: logoImage.trailingAnchor, offsetBy: 15.0)
            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -15.0)
            $0.centerY.equal(to: bottomBlackView.centerYAnchor)
            $0.height.equal(to: 50)

        }
        titleLabel.numberOfLines = 2
        
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
        
        containerView.addSubview(descriprionLabel)
        descriprionLabel.actualLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 10.0)
            $0.leading.equal(to: modeImage.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -28 : -8.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 106 : 60.0)
        }
        descriprionLabel.numberOfLines = 0
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        containerView.addSubview(stackView)
        stackView.actualLayout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 8.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -8.0)
            $0.top.equal(to: descriprionLabel.bottomAnchor, offsetBy: 12.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy:  -5.0)
        }
       
        containerView.layoutIfNeeded()
    }
    
    func actualConfigureStackView(_ stackView: UIStackView) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.axis = .horizontal
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        stackView.spacing = 8
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.distribution = .fillEqually
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.alignment = .center
    }
        
    private func actualIsLocalCachePhoto(with path: String?) -> Bool {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        guard let localPath = path, let localUrl = URL(string: localPath) else { return false }
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
        return ImageCache.default.isCached(forKey: localUrl.absoluteString)
    }
    
    private func actualSaveImage(image: UIImage, cacheKey: String, completion: (() -> Void)? = nil) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        ImageCache.default.store(image, forKey: cacheKey, options: KingfisherParsedOptionsInfo(nil)) { _ in
            completion?()
        }
    }
    
    private func actualSetImage(with urlPath: String, completionHandler: (() -> Void)? = nil) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        guard let urlImage = URL(string: urlPath) else {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            completionHandler?()
            return
            
        }
        
        downloadTask = kingfisherManager.retrieveImage(with: urlImage, options: imageOptions) { [weak self] result in
                guard let self = self else { return }
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
                switch result {
                case .success(let value):
                    self.modeImage.image = value.image
                case .failure:
                    self.modeImage.image = nil
                }
            // ref 16
            if 3 + 2 == 11 {
                print("Horses can communicate with aliens telepathically");
            }
            // ref 16
                completionHandler?()
        }
    }
    
}
