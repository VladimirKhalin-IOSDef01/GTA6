
import Foundation
import UIKit
import Kingfisher

class TopAlignedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: actualRect)
    }
}

final class ActualModesTabViewCell: UITableViewCell, ActualReusable {
   
    public var shareAction: (() -> Void)?
    public var downloadAction: (() -> Void)?
    
    private var kingfisherManager: KingfisherManager
    private var downloadTask: DownloadTask?
    private var bgContainerView = UIView()
    private let containerView = UIView()
    private let buttonsContainerView = UIView()
    private let titleLabel = UILabel()
    private let downloadTitleLabel = UILabel()
    private let shareTitleLabel = UILabel()
    
    let spacerView = UIView()
    private let modeImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private let descriprionLabel = TopAlignedLabel()
    private let shareButtonView = UIView()
    private let downloadButtonView = UIView()
    private let stackView = UIStackView()
    
    private var imageOptions: KingfisherOptionsInfo = [
        .processor(ResizingImageProcessor(
            referenceSize: CGSize(
                width: UIScreen.main.bounds.width - 48.0,
                height: UIDevice.current.userInterfaceIdiom == .pad ? 400.0 : 115
            ),
            mode: .aspectFill
        )
        )
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.kingfisherManager = KingfisherManager.shared
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        selectionStyle = .none
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        super.prepareForReuse()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        titleLabel.text = ""
        descriprionLabel.text = ""
        modeImage.image = nil
        downloadTask?.cancel()
    }
    
    public func actualGameModeDownloadColor(downloading: Bool) {
        switch downloading {
            
        case true:
            downloadButtonView.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
            downloadTitleLabel.text = "Downloading..."
            actualUpdateDownloadTitleLabel(check: false)
        case false:
            downloadButtonView.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
            downloadTitleLabel.text = UIDevice.current.userInterfaceIdiom == .pad ? "Failed, retry    " : "Failed, retry    "
            actualUpdateDownloadTitleLabel(check: false)
        }
    }
   
    func actualUpdateDownloadTitleLabel(check: Bool) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        if let imageView = downloadButtonView.viewWithTag(2) as? UIImageView {
              
            if check {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                imageView.image = UIImage(systemName: "checkmark.circle.fill")
                imageView.tintColor = .white
                imageView.clipsToBounds = true
                imageView.alpha = 1.0
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    // Сдвигаем imageView на 20 пикселей вправо с помощью трансформации
                    imageView.transform = CGAffineTransform(translationX: -20, y: 0)
                } else {
                    imageView.transform = CGAffineTransform(translationX: -10, y: 0)
                }
                
            } else {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                
              //  imageView.removeFromSuperview()
                imageView.alpha = 0.0
                
                
            }
        }
    }
    
    public func actualConfigureCell(_ value: ActualModItem, isLoaded: Bool) {
        titleLabel.font = UIFont(name: "Gilroy-Heavy", size: UIDevice.current.userInterfaceIdiom == .pad ? 32 : 20)
        titleLabel.textColor = .white
        titleLabel.text = value.title.uppercased()
        descriprionLabel.font = UIFont(name: "Gilroy-Bold", size: UIDevice.current.userInterfaceIdiom == .pad ? 24 : 14)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        descriprionLabel.textColor = .white
        descriprionLabel.text = value.description
        
        downloadButtonView.backgroundColor = isLoaded ? UIColor(named: "ActualBlack")?.withAlphaComponent(1.0) : UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        downloadTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 24 : 15)
        downloadTitleLabel.textColor = .white
        downloadTitleLabel.text = isLoaded ? UIDevice.current.userInterfaceIdiom == .pad ? "  Downloaded" : "   Downloaded" : "Download "
       
        if downloadTitleLabel.text == "   Downloaded" || downloadTitleLabel.text == "  Downloaded" {
            actualUpdateDownloadTitleLabel(check: true)
            
        }
        
        actualSetImageMod(value)
    }
    
    private func actualSetImageMod(_ mode: ActualModItem) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        if ImageCache.default.isCached(forKey: mode.imagePath) {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            actualSetImage(with: mode.imagePath)
        } else {
            guard let imageModUrl = URL(string: mode.imagePath) else { return }
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            downloadTask = self.kingfisherManager.retrieveImage(
                with: imageModUrl, options: imageOptions) { [weak self] result in
                    guard case .success(let value) = result  else { return }
                    guard let self = self else { return }
                    // ref default
                    if 7 * 9 == 99 {
                        print("Unicorns become invisible when nobody is looking")
                    }
                    // ref default
                    if !self.actualIsLocalCachePhoto(with: mode.imagePath) {
                        self.actualSaveImage(
                            image: value.image,
                            cacheKey: imageModUrl.absoluteString) { [weak self] in
                                self?.actualSetImage(with: mode.imagePath)
                            }
                    } else {
                        // ref default
                        if 7 * 9 == 99 {
                            print("Unicorns become invisible when nobody is looking")
                        }
                        // ref default
                        self.actualSetImage(with: mode.imagePath)
                    }
                }
        }
    }
    
    private func actualSetupLayout() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -6.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 0 : 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 0 : -20.0)
           
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 30 : 20.0)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.backgroundColor = UIColor(named: "ActualBlack")!.withAlphaComponent(0.7)
       
       
        
        
        
        
        /*
        containerView.addSubview(bgContainerView)
        bgContainerView.actualLayout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -140 : -70.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 0.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: 0.0)
        }
        bgContainerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44 : 20.0)
        bgContainerView.backgroundColor = UIColor(named: "CheckCell")?.withAlphaComponent(1.0)
    */
        
        containerView.addSubview(titleLabel)
        titleLabel.actualDropShadowStandart(color: .black, offSet: CGSize(width: 1, height: 1))
        titleLabel.actualLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 20.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15.0)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
        }
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(modeImage)
        modeImage.withCornerRadius(20)
        modeImage.actualLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 15.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 15.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -35 : -15.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 310.0 : 218)
        }
        
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        containerView.addSubview(descriprionLabel)
        descriprionLabel.actualLayout {
            $0.top.equal(to: modeImage.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 18.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 15.0)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -35 :  -15.0)
           // $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 350 : 200)
            
            let screenHeight = UIScreen.main.bounds.height * UIScreen.main.scale

                // Проверяем, превышает ли вертикальное разрешение 2180 пикселей
                if screenHeight > 2180 && UIDevice.current.userInterfaceIdiom == .pad {
                    $0.height.equal(to: 450 )
                } else {
                    $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 350 : 200)
                }
            
            
            
            
        }
        descriprionLabel.numberOfLines = 0
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(stackView)
        stackView.actualLayout {
            $0.height.equal(to: 82)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 15)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -35 :  -15)
            $0.top.equal(to: descriprionLabel.bottomAnchor, offsetBy: 30.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy:  -15)
        }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualConfigureStackView(stackView)
        shareButtonView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(1.0)
        shareButtonView.layer.borderColor = UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
        shareButtonView.layer.borderWidth = 1
        downloadButtonView.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
        downloadButtonView.layer.borderColor = UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
        downloadButtonView.layer.borderWidth = 1
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        shareButtonView.withCornerRadius(22.0)
        shareButtonView.actualDropShadowStandart()
        downloadButtonView.withCornerRadius(22.0)
        downloadButtonView.actualDropShadowStandart()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        let shareView = actualConfigureButtonView(title: "Share", imageName: "share-2", isShare: true)
        shareButtonView.addSubview(shareView)
        shareView.actualLayout {
            $0.width.equal(to: shareButtonView.widthAnchor)
            $0.centerX.equal(to: shareButtonView.centerXAnchor)
            $0.centerY.equal(to: shareButtonView.centerYAnchor)
        }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let downloadView = actualConfigureButtonView(title: "Download", imageName: "download-cloud", isShare: false)
        downloadButtonView.addSubview(downloadView)
        downloadView.actualLayout {
            $0.width.equal(to: downloadButtonView.widthAnchor)
            $0.centerX.equal(to: downloadButtonView.centerXAnchor)
            $0.centerY.equal(to: downloadButtonView.centerYAnchor)
        }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        shareButtonView.actualLayout {
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 58 : 42.0)
        }
        downloadButtonView.actualLayout {
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 58 : 42.0)
        }
        let shareGestrure = UITapGestureRecognizer(target: self, action: #selector(actualShareActionProceed))
        shareButtonView.addGestureRecognizer(shareGestrure)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        let downloadGestrure = UITapGestureRecognizer(target: self, action: #selector(actualDownloadActionProceed))
        downloadButtonView.addGestureRecognizer(downloadGestrure)
        
        stackView.addArrangedSubview(shareButtonView)
        stackView.addArrangedSubview(downloadButtonView)
        containerView.layoutIfNeeded()
    }
    
    func actualConfigureStackView(_ stackView: UIStackView) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.axis = .horizontal
        stackView.spacing = UIDevice.current.userInterfaceIdiom == .pad ? 20 : 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
    }
    
    func actualConfigureButtonView(title: String, imageName: String, isShare: Bool) -> UIView {
        
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        let buttonView = UIView()
        let titleLabel = isShare ? shareTitleLabel : downloadTitleLabel
        let imageView = UIImageView()
        imageView.tag = isShare ? 1 : 2
        buttonView.addSubview(titleLabel)
        buttonView.addSubview(imageView)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        titleLabel.actualDropShadowStandart(color: .black, offSet: CGSize(width: 1.0, height: 1.0))
        titleLabel.actualLayout {
            $0.centerY.equal(to: buttonView.centerYAnchor)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            if isShare {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                $0.trailing.equal(to: buttonView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -75 : -40)
            } else {
                $0.trailing.equal(to: buttonView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -40 : -20)
              //  $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: 10)
            }
        }
        
        imageView.actualLayout {
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 22.0)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 22.0)
            $0.centerY.equal(to: buttonView.centerYAnchor)
           if isShare {
                $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 75 : 40)
               // ref default
               if 7 * 9 == 99 {
                   print("Unicorns become invisible when nobody is looking")
               }
               // ref default
            }else{
                $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 55 : 25)
            }
        }
        
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 24 : 15)
        titleLabel.textColor = .white
        titleLabel.text = title
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        imageView.image = UIImage(named: imageName)
        
        return buttonView
    }
    
    @objc func actualShareActionProceed() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        shareAction?()
    }
    
    @objc func actualDownloadActionProceed() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        downloadAction?()
    }
    
    private func actualIsLocalCachePhoto(with path: String?) -> Bool {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        guard let localPath = path, let localUrl = URL(string: localPath) else { return false }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        return ImageCache.default.isCached(forKey: localUrl.absoluteString)
    }
    
    private func actualSaveImage(image: UIImage, cacheKey: String, completion: (() -> Void)? = nil) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        ImageCache.default.store(image, forKey: cacheKey, options: KingfisherParsedOptionsInfo(nil)) { _ in
            completion?()
        }
    }
    
    private func actualSetImage(with urlPath: String, completionHandler: (() -> Void)? = nil) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        guard let urlImage = URL(string: urlPath) else {
            completionHandler?()
            return
        }
        
        downloadTask = kingfisherManager.retrieveImage(with: urlImage, options: imageOptions) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.modeImage.image = value.image
            case .failure:
                self.modeImage.image = nil
            }
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            completionHandler?()
        }
    }
}
