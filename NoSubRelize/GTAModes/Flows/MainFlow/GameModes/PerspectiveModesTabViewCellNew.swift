//
//  GTAModes_TableViewCell_New.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 23.02.2024.
//

import Foundation
import UIKit
import Kingfisher

final class PerspectiveModesTabViewCellNew: UITableViewCell, PerspectiveReusable {
    
  // public var shareAction: (() -> Void)?
  //  public var downloadAction: (() -> Void)?
    
    private var kingfisherManager: KingfisherManager
    private var downloadTask: DownloadTask?
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
   // private let downloadTitleLabel = UILabel()
  //  private let shareTitleLabel = UILabel()
    
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
        perspectiveSetupLayout()
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
    
    public func perspectiveConfigure_cell(_ value: PerspectiveModItem, isLoaded: Bool) {
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 16)
        titleLabel.textColor = .white
        titleLabel.text = value.title
        descriprionLabel.font = UIFont(name: "Gilroy-Regular", size: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 15)
        descriprionLabel.textColor = .white
        descriprionLabel.text = value.description
        
//        downloadButtonView.backgroundColor = isLoaded ? UIColor(named: "greenColor")?.withAlphaComponent(0.4) : UIColor(named: "blueColor")?.withAlphaComponent(0.4)
//        downloadTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: 18)
//        downloadTitleLabel.textColor = .white
//        downloadTitleLabel.text = isLoaded ? "Downloaded" : "Download"
        
        perspectiveSetImageMod(value)
    }
    
    private func perspectiveSetImageMod(_ mode: PerspectiveModItem) {
        if ImageCache.default.isCached(forKey: mode.imagePath) {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            perspectiveSetImage(with: mode.imagePath)
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
                    if !self.perspectiveIsLocalCache_Photo(with: mode.imagePath) {
                        self.perspectiveSaveImage(
                            image: value.image,
                            cacheKey: imageModUrl.absoluteString) { [weak self] in
                                self?.perspectiveSetImage(with: mode.imagePath)
                        }
                    } else {
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        self.perspectiveSetImage(with: mode.imagePath)
                    }
            }
        }
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -20.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44 : 20.0)
        containerView.perspectiveDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "CheckCell")?.withAlphaComponent(0.9)
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            containerView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//        }
        
        containerView.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 33 : 20.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 15.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 16)

        }
        titleLabel.numberOfLines = 0
        
        containerView.addSubview(modeImage)
        modeImage.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 20 : 10.0)
        modeImage.perspectiveLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 10.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 8.0)
           // $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -8.0)
            $0.height.equal(to:  UIDevice.current.userInterfaceIdiom == .pad ? 106 : 60.0) // 133
            $0.width.equal(to:  UIDevice.current.userInterfaceIdiom == .pad ? 260 : 148)  //327
        }
        
        
        containerView.addSubview(descriprionLabel)
        descriprionLabel.perspectiveLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 10.0)
            $0.leading.equal(to: modeImage.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -28 : -8.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 106 : 60.0)
           
            
//            $0.top.equal(to: modeImage.bottomAnchor, offsetBy: 8.0)
//            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 8.0)
//            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -8.0)
        }
        descriprionLabel.numberOfLines = 0
        
        containerView.addSubview(stackView)
        stackView.perspectiveLayout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 8.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -8.0)
            $0.top.equal(to: descriprionLabel.bottomAnchor, offsetBy: 12.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy:  -5.0)
        }
        
//        gtavk_configureStackView(stackView)
//        shareButtonView.backgroundColor = UIColor(named: "blueColor")?.withAlphaComponent(0.4)
//        downloadButtonView.backgroundColor = UIColor(named: "blueColor")?.withAlphaComponent(0.4)
//        shareButtonView.withCornerRadius(10.0)
//        shareButtonView.dropShadow()
//        downloadButtonView.withCornerRadius(10.0)
//        downloadButtonView.dropShadow()
//        
//        let shareView = configureButtonView(title: "Share", imageName: "share-2", isShare: true)
//        shareButtonView.addSubview(shareView)
//        shareView.gta_layout {
//            $0.centerX.equal(to: shareButtonView.centerXAnchor)
//            $0.centerY.equal(to: shareButtonView.centerYAnchor)
//        }
//        
//        let downloadView = configureButtonView(title: "Download", imageName: "download-cloud", isShare: false)
//        downloadButtonView.addSubview(downloadView)
//        downloadView.gta_layout {
//            $0.centerX.equal(to: downloadButtonView.centerXAnchor)
//            $0.centerY.equal(to: downloadButtonView.centerYAnchor)
//        }
//        
//        shareButtonView.gta_layout {
//            $0.height.equal(to: 40.0)
//        }
//        downloadButtonView.gta_layout {
//            $0.height.equal(to: 40.0)
//        }
//        let shareGestrure = UITapGestureRecognizer(target: self, action: #selector(gtavk_shareActionProceed))
//        shareButtonView.addGestureRecognizer(shareGestrure)
//        
//        
//        let downloadGestrure = UITapGestureRecognizer(target: self, action: #selector(gtavk_downloadAction_Proceed))
//        downloadButtonView.addGestureRecognizer(downloadGestrure)
//        
//        stackView.addArrangedSubview(shareButtonView)
//        stackView.addArrangedSubview(downloadButtonView)
        containerView.layoutIfNeeded()
    }
    
    func perspectiveConfigureStackView(_ stackView: UIStackView) {
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
    
//    func configureButtonView(title: String, imageName: String, isShare: Bool) -> UIView {
//        let buttonView = UIView()
//        let titleLabel = isShare ? shareTitleLabel : downloadTitleLabel
//        let imageView = UIImageView()
//        buttonView.addSubview(imageView)
//        buttonView.addSubview(titleLabel)
//        titleLabel.dropShadow(color: .black, offSet: CGSize(width: 1.0, height: 1.0))
//        titleLabel.gta_layout {
//            $0.top.equal(to: buttonView.topAnchor)
//            if isShare {
//                $0.leading.equal(to: imageView.trailingAnchor, offsetBy: 60)
//                $0.trailing.equal(to: buttonView.trailingAnchor, offsetBy: 10)
//            } else {
//                $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: 0)
//                $0.trailing.equal(to: imageView.leadingAnchor, offsetBy: -35.0)
//            }
//            $0.bottom.equal(to: buttonView.bottomAnchor)
//        }
//        imageView.gta_layout {
//            $0.height.equal(to: 18.0)
//            $0.width.equal(to: 18.0)
//            if isShare {
//                $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: -10)
//            }else{
//                $0.trailing.equal(to: buttonView.trailingAnchor)
//            }
//            $0.centerY.equal(to: buttonView.centerYAnchor)
//        }
//        
//        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: 20)
//        titleLabel.textColor = .white
//        titleLabel.text = title
//        
//        imageView.image = UIImage(named: imageName)
//        
//        return buttonView
//    }
    
//    @objc func gtavk_shareActionProceed() {
//        shareAction?()
//    }
//    
//    @objc func gtavk_downloadAction_Proceed() {
//        downloadAction?()
//    }
    
    private func perspectiveIsLocalCache_Photo(with path: String?) -> Bool {
        guard let localPath = path, let localUrl = URL(string: localPath) else { return false }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return ImageCache.default.isCached(forKey: localUrl.absoluteString)
    }
    
    private func perspectiveSaveImage(image: UIImage, cacheKey: String, completion: (() -> Void)? = nil) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        ImageCache.default.store(image, forKey: cacheKey, options: KingfisherParsedOptionsInfo(nil)) { _ in
            completion?()
        }
    }
    
    private func perspectiveSetImage(with urlPath: String, completionHandler: (() -> Void)? = nil) {
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
