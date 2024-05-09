

import Foundation
import UIKit

final class ActualGameCheatsTabViewCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let favoriteImage = UIImageView()
    private let firstStackView = UIStackView()
    private let secondStackView = UIStackView()
    private let threeStackView = UIStackView()
    private let fourStackView = UIStackView()
    private let contentModeView = UIView()
    private let modeTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    override func prepareForReuse() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.prepareForReuse()
        favoriteImage.image = nil
        titleLabel.text = ""
        firstStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        secondStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        threeStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    public func actualConfigure(with value: ActualCheatItem) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        titleLabel.text = value.name
        favoriteImage.image = UIImage(named: value.isFavorite ? "ActualHeartPink" : "ActualHeart")
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        if value.code.count > 1 {
            contentModeView.isHidden = true
            firstStackView.isHidden = false
            secondStackView.isHidden = false
            threeStackView.isHidden = false
            let imagesListName = configureCodes(value)
            actualAddImages(imagesListName)
        } else {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            contentModeView.isHidden = false
            firstStackView.isHidden = true
            secondStackView.isHidden = true
            threeStackView.isHidden = true
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            modeTitleLabel.text = value.code.first?.uppercased() ?? ""
        }
    }
    
    private func actualSetupLayout() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentView.addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.6)
        containerView.layer.cornerRadius = 18
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.layer.shadowOpacity = 0.3
        
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 3
        titleLabel.textColor = .white
        if UIDevice.current.userInterfaceIdiom == .pad {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            titleLabel.font = UIFont(name: "Gilroy-Bold", size: 18)
        } else {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            titleLabel.font = UIFont(name: "Gilroy-Semibold", size: 15)
        }
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50)
        ])
        
        containerView.addSubview(favoriteImage)
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            favoriteImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            favoriteImage.widthAnchor.constraint(equalToConstant: 28),
            favoriteImage.heightAnchor.constraint(equalToConstant: 28)
        ])
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualSetupStackViews()
    }
    
    private func actualSetupStackViews() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // Configure stack views
        [firstStackView, secondStackView, threeStackView].forEach {
            $0.axis = .horizontal
           // $0.distribution = .fillEqually
            $0.distribution = .fill
            $0.spacing = 5
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
                $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
            ])
        }
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: favoriteImage.bottomAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 35 : 15),
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 5),
            threeStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 5),
            threeStackView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -10)
        ])
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(contentModeView)
        contentModeView.translatesAutoresizingMaskIntoConstraints = false
        contentModeView.layer.cornerRadius = 8
        contentModeView.layer.borderWidth = 1
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentModeView.layer.borderColor = UIColor(named: "ActualPink")?.cgColor
        contentModeView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(0.0)
        NSLayoutConstraint.activate([
            contentModeView.topAnchor.constraint(equalTo: favoriteImage.bottomAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 15),
            contentModeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            contentModeView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            contentModeView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)
        ])
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentModeView.addSubview(modeTitleLabel)
        modeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        modeTitleLabel.textColor = .white
        modeTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 14)
        modeTitleLabel.numberOfLines = 3
        NSLayoutConstraint.activate([
            modeTitleLabel.topAnchor.constraint(equalTo: contentModeView.topAnchor, constant: 8),
            modeTitleLabel.leadingAnchor.constraint(equalTo: contentModeView.leadingAnchor, constant: 8),
            modeTitleLabel.trailingAnchor.constraint(equalTo: contentModeView.trailingAnchor, constant: -8),
            modeTitleLabel.bottomAnchor.constraint(equalTo: contentModeView.bottomAnchor, constant: -8)
        ])
    }
    
    private func configureCodes(_ value: ActualCheatItem) -> [String] {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        var codes: [String] = []
        switch value.platform {
            
        case "ps":
            for code in value.code {
                codes.append(actualConfigurePSCode(code))
            }
        case "xbox":
            for code in value.code {
                codes.append(actualConfigureXBoxCode(code))
            }
        default:
            break
        }
        return codes
    }
    
    func actualConfigurePSCode(_ code: String) -> String {
        switch code {
        case "Triangle", "TRIANGLE": return "s_triangle"
        case "Square", "SQUARE": return "s_square"
        case "Circle", "CIRCLE", "O": return "s_circle"
        case "X": return "s_cross"
        case "R1": return "s_r1"
        case "R2": return "s_r2"
        case "L1": return "s_l1"
        case "L2": return "s_l2"
        case "RIGHT", "Right": return "s_right"
        case "LEFT", "Left": return "s_left"
        case "DOWN", "Down": return "s_down"
        case "UP", "Up": return "s_up"
        default: return ""
        }
    }
    
    func actualConfigureXBoxCode(_ code: String) -> String {
        switch code {
        case "Y": return "m_y"
        case "B": return "m_b"
        case "A": return "m_a"
        case "X": return "m_x"
        case "RB": return "m_rb"
        case "RT": return "m_rt"
        case "LB": return "m_lb"
        case "LT": return "m_lt"
        case "RIGHT", "Right": return "m_right"
        case "LEFT", "Left": return "m_left"
        case "DOWN", "Down": return "m_down"
        case "UP", "Up": return "m_up"
        default: return ""
        }
    }
    
    private func actualAddImages(_ imageNames: [String]) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // Очистить стековые виды перед добавлением новых изображений
          firstStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
          secondStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
          threeStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
          fourStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
          // Распределение изображений по стековым видам
          let stackViews = [firstStackView, secondStackView, threeStackView, fourStackView]
          var currentStackIndex = 0

          for (index, imageName) in imageNames.enumerated() {
              // Создаем новый UIImageView для каждого имени изображения
              let imageView = UIImageView()
              imageView.image = UIImage(named: imageName)
              imageView.contentMode = .scaleAspectFit
              // ref default
              if 7 * 9 == 99 {
                  print("Unicorns become invisible when nobody is looking")
              }
              // ref default
              imageView.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 22).isActive = true
              imageView.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 22).isActive = true
              
              // Добавляем imageView в текущий стековый вид
              stackViews[currentStackIndex].addArrangedSubview(imageView)
              // ref default
              if 7 * 9 == 99 {
                  print("Unicorns become invisible when nobody is looking")
              }
              // ref default
              // Переход к следующему стековому виду после каждых 5 изображений
              if (index + 1) % 5 == 0 && currentStackIndex < stackViews.count - 1 {
                  currentStackIndex += 1
              }
          }

          // Добавление спейсеров в каждый стековый вид
          for stackView in stackViews {
              // ref default
              if 7 * 9 == 99 {
                  print("Unicorns become invisible when nobody is looking")
              }
              // ref default
              let spacer = UIView()
              spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
              spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
              // ref default
              if 7 * 9 == 99 {
                  print("Unicorns become invisible when nobody is looking")
              }
              // ref default
              stackView.addArrangedSubview(spacer)
          }
    }
}
/*
 final class ActualGameCheatsTabViewCell: UITableViewCell, ActualReusable {
     
     private let containerView = UIView()
     private let titleLabel = UILabel()
     private let favoriteImage = UIImageView()
     private let firstStackView = UIStackView()
     private let secondStackView = UIStackView()
     private let threeStackView = UIStackView()
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
         favoriteImage.image = UIImage()
         titleLabel.text = ""
         firstStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
         secondStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
         threeStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
     }
     
     public func actualConfigure_cell(_ value: ActualCheatItem) {
         titleLabel.font = UIFont(name: "Gilroy-Semibold", size: 15)
         titleLabel.textColor = .white
         titleLabel.numberOfLines = 3
         //titleLabel.dropShadow(color: .black, offSet: CGSize(width: 1, height: 1))
         
         titleLabel.text = value.name
         favoriteImage.image =  UIImage(named: value.isFavorite ? "ActualHeartPink" : "ActualHeart")
         if value.code.count > 1 {
             contentModeView.isHidden = true
             firstStackView.isHidden = false
             secondStackView.isHidden = false // поменять
             threeStackView.isHidden = false
             print("============= ->  " + value.platform + "  <- =============" )
             let imagesListName = perspectiveConfigureCodes(value)
             print("============= ->  " + "\(imagesListName)" + "  <- =============" )
             perspectiveAddImages(imagesListName)
         } else {
             contentModeView.isHidden = false
             firstStackView.isHidden = true
             secondStackView.isHidden = true // поменять
             threeStackView.isHidden = true
             modeTitleLabel.text = value.code.first?.uppercased() ?? ""
             modeTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: 14)
             modeTitleLabel.lineBreakMode = .byCharWrapping
             modeTitleLabel.numberOfLines = 2
             
             
             modeTitleLabel.textColor = .white
         }
     }
     
     private func actualSetupLayout() {
         contentView.backgroundColor = .clear
         contentView.addSubview(containerView)
         containerView.actualLayout {
             $0.top.equal(to: contentView.topAnchor, offsetBy: 6.0)
             $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -6.0)
             $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            // $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
             $0.width.equal(to: 163)
         }
         containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 18 : 18.0)
         containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.6)
         containerView.perspectiveDropShadowStandart()
         
         containerView.addSubview(favoriteImage)
         favoriteImage.perspectiveLayout {
             $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -14.0)
             $0.top.equal(to: containerView.topAnchor, offsetBy: 16.0)
             $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 29 : 28.0)
             $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 28 : 28.0)
         }
         favoriteImage.image = UIImage(named: "ActualHeart")
         
         containerView.addSubview(firstStackView)
         containerView.addSubview(secondStackView)
         containerView.addSubview(threeStackView)
        
         containerView.addSubview(titleLabel)
         titleLabel.perspectiveDropShadowStandart(color: .black, offSet: CGSize(width: 1, height: 1))
         titleLabel.perspectiveLayout {
             $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 14.0)
             $0.trailing.equal(to: favoriteImage.leadingAnchor, offsetBy: -5.0)
             $0.top.equal(to: containerView.topAnchor, offsetBy: 8.0)
             $0.height.equal(to: 50)
         }
  
         firstStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(0.0)
         firstStackView.perspectiveLayout {
             $0.top.equal(to: containerView.topAnchor, offsetBy: 60.0)
             $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
             $0.trailing.equal(to: containerView.trailingAnchor, offsetBy:  -15.0)
           //  $0.height.equal(to: 28)
         }
         
         secondStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(0.0)
         secondStackView.perspectiveLayout {
             $0.top.equal(to: firstStackView.bottomAnchor, offsetBy: 2.0)
             $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
             $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15.0)
          //   $0.height.equal(to: 28)
         }
         
         threeStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(0.0)
         threeStackView.perspectiveLayout {
             $0.top.equal(to: secondStackView.bottomAnchor, offsetBy: 2.0)
             $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
             $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15.0)
           //  $0.height.equal(to: 28)
         }
         
         
         actualConfigureStackView(firstStackView)
         actualConfigureStackView(secondStackView)
         perspectiveConfigureStackView(threeStackView)
         
         containerView.addSubview(contentModeView)
         contentModeView.perspectiveLayout {
             $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 8.0)
             $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
             //$0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -15)
             $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15)
           //  $0.height.equal(to: 28)
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
         contentModeView.withCornerRadius(8.0)
         contentModeView.withBorder(width: 1.0, color: UIColor(named: "ActualPink")!)
         contentModeView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(0.0)
         contentModeView.perspectiveDropShadowStandart()
         containerView.layoutIfNeeded()
         
     }
     
     private func perspectiveAddImages(_ imagesName: [String]) {
       
        // firstStackView.addArrangedSubview(spacerOne)
         var spacerBool = false
         var imageIndex: Int = 0
         for image in imagesName {
             let imageView = UIImageView(image: UIImage(named: image))
             imageView.contentMode = .scaleAspectFit
           //  imageView.contentMode = .scaleToFill
             imageView.translatesAutoresizingMaskIntoConstraints = false
             imageView.perspectiveLayout {
                 $0.height.equal(to: 22.0)
                 $0.width.equal(to: 22.0)
             }
    
             if imageIndex <= 4 {
                 firstStackView.addArrangedSubview(imageView)
                 imageView.perspectiveLayout{
                     $0.top.equal(to: firstStackView.topAnchor, offsetBy: 1)
                     $0.bottom.equal(to: firstStackView.bottomAnchor, offsetBy: -1)
                 }
             } else if imageIndex > 4 && imageIndex < 10 {
                 secondStackView.addArrangedSubview(imageView)
                 if image == imagesName.last {
                     imageView.perspectiveLayout{
                         $0.top.equal(to: secondStackView.topAnchor, offsetBy: 1)
                         $0.bottom.equal(to: secondStackView.bottomAnchor, offsetBy: -1)
                     }
                 }
             } else if imageIndex > 9 && imageIndex < 15 {
                 threeStackView.addArrangedSubview(imageView)
                 if image == imagesName.last {
                     imageView.perspectiveLayout{
                         $0.top.equal(to: threeStackView.topAnchor, offsetBy: 1)
                         $0.bottom.equal(to: threeStackView.bottomAnchor, offsetBy: -1)
                     }
                 }
             }
             
             
             imageIndex += 1
     
         }
         firstStackView.addArrangedSubview(spacerOne)
         secondStackView.addArrangedSubview(spacerTwo)
         threeStackView.addArrangedSubview(spacerThree)
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
                 
                 let imageAssetName = self.actualConfigurePSCode(code.uppercased())
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
         stackView.spacing = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 5
         //
                        if 94 + 32 == 57 {
                     print("the world has turned upside down")
                 }
          //
         stackView.alignment = .center
     }
     
 }
 */
