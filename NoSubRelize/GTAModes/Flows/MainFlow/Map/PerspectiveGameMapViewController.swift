
import UIKit
import WebKit

protocol PerspectiveMap_NavigationHandler: AnyObject {
    
    func mapDidRequestToBack()
    
}

class PerspectiveGameMapViewController: PerspectiveNiblessViewController {
    
    private let perspectiveModes_navigationHandler: PerspectiveMap_NavigationHandler
    private let perspectiveModes_webView = WKWebView()
    private let customNavigation: PerspectiveCustomNavigation_View
    private let fullScreenButton = UIButton() // Создание кнопки
    private var fullScreen = false
    private var nameIcon = "fsIn"
    
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    
    
    init(navigationHandler: PerspectiveMap_NavigationHandler) {
        self.perspectiveModes_navigationHandler = navigationHandler
        self.customNavigation = PerspectiveCustomNavigation_View(.map)
        
        super.init()
        customNavigation.leftButtonAction = { [weak self] in
            self?.perspectiveModes_navigationHandler.mapDidRequestToBack()
        }
        
       
    }
    
    override func viewDidLoad() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        super.viewDidLoad()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
        perspectiveSetupView()
        perspectiveWebViewConfigure()
        setupFSButton()
        
        
    }
    
    
    private func setupFSButton() {
               // let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .default)
              //  let buttonImage = UIImage(systemName: "arrow.up.arrow.down.square", withConfiguration: symbolConfiguration)
        nameIcon = fullScreen ? "fsOutt" :  "fsInn"
        if let buttonImage = UIImage(named: nameIcon) {
            // Создаем контекст с новым размером изображения
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 18, height: 18), false, 0.0)
            buttonImage.draw(in: CGRect(x: 0, y: 0, width: 18, height: 18))
            let resizedButtonImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
                fullScreenButton.setImage(resizedButtonImage, for: .normal)
                fullScreenButton.tintColor = .black
                fullScreenButton.backgroundColor = .white
                fullScreenButton.layer.shadowColor = UIColor.black.cgColor
                fullScreenButton.layer.shadowOpacity = 0.6
                fullScreenButton.layer.shadowOffset = CGSize(width: 0, height: 0)
                fullScreenButton.layer.shadowRadius = 2
           
                fullScreenButton.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
                fullScreenButton.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
                fullScreenButton.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
           }
    }
    
    
    
    @objc private func buttonTapped() {
        fullScreenButton.layer.borderColor = UIColor.orange.withAlphaComponent(0.6).cgColor
       }
       
       @objc private func buttonReleased() {
           fullScreenButton.layer.borderColor = UIColor.clear.cgColor
           fullScreen.toggle()
           
           updateViewForFullScreen(fullScreen)
       }
    
    func updateViewForFullScreen(_ fullScreen: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.customNavigation.isHidden = fullScreen
            self.perspectiveSetupView()
            self.setupFSButton()
            self.view.layoutIfNeeded()
        })
        self.fullScreen = fullScreen
    }
    
    
    private func perspectiveSetupView() {
        
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 36.0)
        }
        
        view.addSubview(perspectiveModes_webView)
        perspectiveModes_webView.scrollView.contentInsetAdjustmentBehavior = .never
        
        leadingConstraint?.isActive = false
        trailingConstraint?.isActive = false
        topConstraint?.isActive = false
        bottomConstraint?.isActive = false
        
        leadingConstraint = perspectiveModes_webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: fullScreen ? 0 : 30.0)
        trailingConstraint = perspectiveModes_webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: fullScreen ? 0 : -30.0)
        bottomConstraint = fullScreen ?
        perspectiveModes_webView.bottomAnchor.constraint(equalTo: view.bottomAnchor) :
        perspectiveModes_webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0)
        
        
        
        perspectiveModes_webView.perspectiveLayout {
            topConstraint = fullScreen ?
            $0.top.equal(to: view.topAnchor, offsetBy: 0) :
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 20.0)
        }
        
        UIView.animate(withDuration: 0.2) {
               self.view.layoutIfNeeded()
           }
        
        perspectiveModes_webView.layer.cornerRadius = 12.0
        perspectiveModes_webView.layer.masksToBounds = true
        
        leadingConstraint?.isActive = true
        trailingConstraint?.isActive = true
        topConstraint?.isActive = true
        bottomConstraint?.isActive = true
        
        
        
        
        
        
        view.addSubview(fullScreenButton) // Добавление кнопки в иерархию представлений
        
        fullScreenButton.layer.borderWidth = 2 // Толщина границы
        fullScreenButton.layer.borderColor = UIColor.clear.cgColor
        fullScreenButton.layer.cornerRadius = 3 // Скругление углов
        
               fullScreenButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                fullScreenButton.trailingAnchor.constraint(equalTo: perspectiveModes_webView.trailingAnchor, constant: -14),
                  // fullScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   fullScreenButton.topAnchor.constraint(equalTo: perspectiveModes_webView.topAnchor, constant: 50),
                   fullScreenButton.heightAnchor.constraint(equalToConstant: 33), // Установленная высота кнопки
                   fullScreenButton.widthAnchor.constraint(equalToConstant: 33)
               ])
               fullScreenButton.layer.cornerRadius = 3
    }
    
    private func perspectiveWebViewConfigure() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if let htmlPath = Bundle.main.path(forResource: "map", ofType: "html") {
            let fileURL = URL(fileURLWithPath: htmlPath)
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            perspectiveModes_webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        }
        
    }
    
}
