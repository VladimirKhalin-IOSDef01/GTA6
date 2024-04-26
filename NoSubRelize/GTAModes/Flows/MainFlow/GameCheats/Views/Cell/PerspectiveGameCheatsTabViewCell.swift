

import Foundation
import UIKit

final class PerspectiveGameCheatsTabViewCell: UITableViewCell, PerspectiveReusable {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let favoriteImage = UIImageView()
    private let firstStackView = UIStackView()
    private let secondStackView = UIStackView()
    private let contentModeView = UIView()
    private let modeTitleLabel = UILabel()
    private let spacerOne = UIView()
    private let spacerTwo = UIView()
    private let spacerThree = UIView()
    private let spacerFore = UIView()
    private let screenWidth = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        favoriteImage.image = UIImage()
        titleLabel.text = ""
        firstStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        secondStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    public func perspectiveConfigure_cell(_ value: PerspectiveCheat_Item) {
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 16)
        titleLabel.textColor = .white
        //titleLabel.dropShadow(color: .black, offSet: CGSize(width: 1, height: 1))
        
        titleLabel.text = value.name
        favoriteImage.image =  UIImage(named: value.isFavorite ? "favoritesYes" : "favoritesNo")
        if value.code.count > 1 {
            contentModeView.isHidden = true
            firstStackView.isHidden = false
            secondStackView.isHidden = true // поменять
            print("============= ->  " + value.platform + "  <- =============" )
            let imagesListName = perspectiveConfigureCodes(value)
            print("============= ->  " + "\(imagesListName)" + "  <- =============" )
            perspectiveAddImages(imagesListName)
        } else {
            contentModeView.isHidden = false
            firstStackView.isHidden = true
            secondStackView.isHidden = true // поменять
            modeTitleLabel.text = value.code.first ?? ""
            modeTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: 16)
            modeTitleLabel.textColor = .white
        }
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 6.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -6.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44 : 20.0)
        containerView.backgroundColor = UIColor(named: "CheckCell")?.withAlphaComponent(1.0)
        containerView.perspectiveDropShadowStandart()
        
        containerView.addSubview(favoriteImage)
        favoriteImage.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -33 : -15.0)
            $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 32 : 10.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 32 : 21.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 20.0)
        }
        favoriteImage.image = UIImage(named: "favoritesNo")
        
        containerView.addSubview(firstStackView)
        containerView.addSubview(secondStackView)
        containerView.addSubview(titleLabel)
        titleLabel.perspectiveDropShadowStandart(color: .black, offSet: CGSize(width: 1, height: 1))
        titleLabel.perspectiveLayout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 18.0)
            $0.trailing.equal(to: favoriteImage.leadingAnchor, offsetBy: -8.0)
            $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 33 : 17.0)
        //    $0.bottom.equal(to: firstStackView.topAnchor, offsetBy: -12.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 26 : 15)
        }
 
        firstStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        firstStackView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 20 : 10)
        firstStackView.perspectiveDropShadowStandart()
        firstStackView.perspectiveLayout {
           // $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 17.0)
            $0.top.equal(to: containerView.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 70 : 40.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -28 : -15.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 45 : 30)
        }
       /*
        firstStackView.gta_layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 15.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -15.0)
            $0.height.equal(to: 28)
        }
        */
        
        
        
        secondStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        secondStackView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 20 : 10)
        secondStackView.perspectiveDropShadowStandart()
        secondStackView.perspectiveLayout {
            $0.top.equal(to: firstStackView.bottomAnchor, offsetBy: 8.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -28 : -15.0)
           // $0.height.equal(to: 28)
            $0.height.equal(to: 0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -8.0)
        }
        perspectiveConfigureStackView(firstStackView)
        perspectiveConfigureStackView(secondStackView)
        
        containerView.addSubview(contentModeView)
        contentModeView.perspectiveLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 8.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 33 : 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -33 : -15)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 28)
            //$0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -8.0)
        }
        
        contentModeView.addSubview(modeTitleLabel)
        modeTitleLabel.perspectiveLayout {
            $0.top.equal(to: contentModeView.topAnchor, offsetBy: 4.0)
            $0.bottom.equal(to: contentModeView.bottomAnchor, offsetBy: -4.0)
            $0.leading.equal(to: contentModeView.leadingAnchor, offsetBy: 8.0)
            $0.trailing.equal(to: contentModeView.trailingAnchor, offsetBy: -8.0)
            $0.centerY.equal(to: contentModeView.centerYAnchor)
        }
        contentModeView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 20 : 10.0)
       // contentModeView.withBorder(width: 1.0, color: UIColor(named: "blueLight")!)
        contentModeView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        contentModeView.perspectiveDropShadowStandart()
        containerView.layoutIfNeeded()
        
    }
    
    private func perspectiveAddImages(_ imagesName: [String]) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        firstStackView.addArrangedSubview(spacerOne)
        var spacerBool = false
        var imageIndex: Int = 0
        for image in imagesName {
            let imageView = UIImageView(image: UIImage(named: image))
            imageView.contentMode = .scaleAspectFit
          //  imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.perspectiveLayout {
                $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 19.0)
                $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 19.0)
               
            }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            let halfIndex = UIDevice.current.userInterfaceIdiom == .pad ? 28 : 28
            if imageIndex <= Int(screenWidth) / halfIndex {
                firstStackView.addArrangedSubview(imageView)
                imageView.perspectiveLayout{
                    $0.top.equal(to: firstStackView.topAnchor, offsetBy: 5)
                    $0.bottom.equal(to: firstStackView.bottomAnchor, offsetBy: -5)
                }
            } else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                if !spacerBool {
                    secondStackView.addArrangedSubview(spacerThree)
                    spacerBool.toggle()
                }
                secondStackView.addArrangedSubview(imageView)
                if image == imagesName.last {
                    secondStackView.addArrangedSubview(spacerFore)
                    imageView.perspectiveLayout{
                    $0.top.equal(to: secondStackView.topAnchor, offsetBy: 5)
                    $0.bottom.equal(to: secondStackView.bottomAnchor, offsetBy: -5)
                }
                }
            }
            imageIndex += 1
    
        }
        firstStackView.addArrangedSubview(spacerTwo)
    }
    
    func perspectiveConfigureCodes(_ value: PerspectiveCheat_Item) -> [String] {
        var trueCode: [String] = []
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if value.platform == "ps" {
            value.code.forEach { [weak self] code in
                guard let self = self else { return }
                
                let imageAssetName = self.perspectiveConfigurePSCode(code.uppercased())
                if imageAssetName == "" {
                    print(code)
                    print(value.code)
                }
                trueCode.append(imageAssetName)
            }
        }
        
        if value.platform == "xbox" {
            value.code.forEach { [weak self] code in
                guard let self = self else { return }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                let imageAssetName = self.perspectiveConfigureXBoxCode(code.uppercased())
                if imageAssetName == "" {
                    print(code)
                    print(value.code)
                }
                trueCode.append(imageAssetName)
            }
        }
        
        return trueCode
    }
    
    func perspectiveConfigurePSCode(_ code: String) -> String {
        if code == "TRIANGLE" {
            return "s_triangle"
        }
        if code == "SQUARE" {
            return "s_square"
        }
        if code == "CIRCLE" || code == "O" {
            return "s_circle"
        }
        if code == "X" {
            return "s_cross"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "R1" {
            return "s_r1"
        }
        if code == "R2" {
            return "s_r2"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "L1" {
            return "s_l1"
        }
        if code == "L2" {
            return "s_l2"
        }
        if code == "RIGHT" {
            return "s_right"
        }
        if code == "LEFT" {
            return "s_left"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "DOWN" {
            return "s_down"
        }
        if code == "UP" {
            return "s_up"
        }
        return ""
    }
    
    func perspectiveConfigureXBoxCode(_ code: String) -> String {
        if code == "Y" {
            return "m_y"
        }
        if code == "B" {
            return "m_b"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "A" {
            return "m_a"
        }
        if code == "X" {
            return "m_x"
        }
        if code == "RB" {
            return "m_rb"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "RT" {
            return "m_rt"
        }
        if code == "LB" {
            return "m_lb"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "LT" {
            return "m_lt"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "RIGHT" {
            return "m_right"
        }
        if code == "LEFT" {
            return "m_left"
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if code == "DOWN" || code == "Down" {
            return "m_down"
        }
        if code == "UP" {
            return "m_up"
        }
        
        if code == "R" || code == "L" || code == "BLACK" || code == "WHITE" {
            return "m_up"
        }
        return ""
    }
    
    func perspectiveConfigureStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        stackView.spacing = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 3
        stackView.distribution = .fill
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        stackView.alignment = .center
    }
    
}
