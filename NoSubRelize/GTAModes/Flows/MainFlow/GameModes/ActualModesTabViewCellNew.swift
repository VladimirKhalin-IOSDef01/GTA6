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
        super.prepareForReuse()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
        descriprionLabel.text = value.description
        logoImage.image = UIImage(named: "ActualModsLogo")
        actualSetImageMod(value)
    }
    
    private func actualSetImageMod(_ mode: ActualModItem) {
        if ImageCache.default.isCached(forKey: mode.imagePath) {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            actualSetImage(with: mode.imagePath)
        } else {
            guard let imageModUrl = URL(string: mode.imagePath) else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            downloadTask = self.kingfisherManager.retrieveImage(
                with: imageModUrl, options: imageOptions) { [weak self] result in
                    guard case .success(let value) = result  else { return }
                    guard let self = self else { return }
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    if !self.actualIsLocalCachePhoto(with: mode.imagePath) {
                        self.actualSaveImage(
                            image: value.image,
                            cacheKey: imageModUrl.absoluteString) { [weak self] in
                                self?.actualSetImage(with: mode.imagePath)
                        }
                    } else {
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        self.actualSetImage(with: mode.imagePath)
                    }
            }
        }
    }
    
    private func actualSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -20.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44 : 20.0)
        containerView.actualDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.80)

        containerView.addSubview(modeImage)
        modeImage.withCornerRadius(20.0)
        modeImage.actualLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: 0.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: 0.0)
        }
        
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
        
        containerView.addSubview(logoImage)
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleAspectFill
        logoImage.actualLayout {
            $0.leading.equal(to: bottomBlackView.leadingAnchor, offsetBy: 16)
            $0.centerY.equal(to: bottomBlackView.centerYAnchor)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 36 : 18)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 36 : 18)
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.actualLayout {
           // $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 33 : 20.0)
            $0.leading.equal(to: logoImage.trailingAnchor, offsetBy: 15.0)
            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -15.0)
            $0.centerY.equal(to: bottomBlackView.centerYAnchor)
            $0.height.equal(to: 50)

        }
        titleLabel.numberOfLines = 2
        
        
        
        containerView.addSubview(descriprionLabel)
        descriprionLabel.actualLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 10.0)
            $0.leading.equal(to: modeImage.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -28 : -8.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 106 : 60.0)
        }
        descriprionLabel.numberOfLines = 0
        
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
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        stackView.axis = .horizontal
        stackView.spacing = 8
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        stackView.distribution = .fillEqually
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        stackView.alignment = .center
    }
        
    private func actualIsLocalCachePhoto(with path: String?) -> Bool {
        guard let localPath = path, let localUrl = URL(string: localPath) else { return false }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return ImageCache.default.isCached(forKey: localUrl.absoluteString)
    }
    
    private func actualSaveImage(image: UIImage, cacheKey: String, completion: (() -> Void)? = nil) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        ImageCache.default.store(image, forKey: cacheKey, options: KingfisherParsedOptionsInfo(nil)) { _ in
            completion?()
        }
    }
    
    private func actualSetImage(with urlPath: String, completionHandler: (() -> Void)? = nil) {
        guard let urlImage = URL(string: urlPath) else {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            completionHandler?()
            return
            
        }
        
        downloadTask = kingfisherManager.retrieveImage(with: urlImage, options: imageOptions) { [weak self] result in
                guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
                switch result {
                case .success(let value):
                    self.modeImage.image = value.image
                case .failure:
                    self.modeImage.image = nil
                }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
                completionHandler?()
        }
    }
    
}
