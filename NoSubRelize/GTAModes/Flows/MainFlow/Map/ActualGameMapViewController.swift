
import UIKit
import WebKit

protocol ActualMap_NavigationHandler: AnyObject {
    
    func actualMapDidRequestToBack()
    
}

class ActualGameMapViewController: ActualNiblessViewController {
    
    private let perspectiveModes_navigationHandler: ActualMap_NavigationHandler
    private let perspectiveModes_webView = WKWebView()
    private let customNavigation: ActualCustomNavigation_View
    private let fullScreenButton = UIButton() // Создание кнопки
    private var fullScreen = false
    private var nameIcon = "fsIn"
    
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    
    
    init(navigationHandler: ActualMap_NavigationHandler) {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        self.perspectiveModes_navigationHandler = navigationHandler
        self.customNavigation = ActualCustomNavigation_View(.map)
        
        super.init()
        customNavigation.leftButtonAction = { [weak self] in
            self?.perspectiveModes_navigationHandler.actualMapDidRequestToBack()
        }
        
       
    }
    
    override func viewDidLoad() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        super.viewDidLoad()
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        
        actualSetupView()
        actualWebViewConfigure()
        actualSetupFSButton()
        
        
    }
    
    
    private func actualSetupFSButton() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
               // let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .default)
              //  let buttonImage = UIImage(systemName: "arrow.up.arrow.down.square", withConfiguration: symbolConfiguration)
        nameIcon = fullScreen ? "fsOutt" :  "fsInn"
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        if let buttonImage = UIImage(named: nameIcon) {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            // Создаем контекст с новым размером изображения
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 18, height: 18), false, 0.0)
            buttonImage.draw(in: CGRect(x: 0, y: 0, width: 18, height: 18))
            let resizedButtonImage = UIGraphicsGetImageFromCurrentImageContext()
            // ref 16
            if 3 + 2 == 11 {
                print("Horses can communicate with aliens telepathically");
            }
            // ref 16
            UIGraphicsEndImageContext()
                fullScreenButton.setImage(resizedButtonImage, for: .normal)
                fullScreenButton.tintColor = .black
                fullScreenButton.backgroundColor = .white
                fullScreenButton.layer.shadowColor = UIColor.black.cgColor
                fullScreenButton.layer.shadowOpacity = 0.6
                fullScreenButton.layer.shadowOffset = CGSize(width: 0, height: 0)
                fullScreenButton.layer.shadowRadius = 2
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
                fullScreenButton.addTarget(self, action: #selector(actualButtonTapped), for: .touchDown)
                fullScreenButton.addTarget(self, action: #selector(actualButtonReleased), for: .touchUpInside)
                fullScreenButton.addTarget(self, action: #selector(actualButtonReleased), for: .touchUpOutside)
           }
    }
    
    
    
    @objc private func actualButtonTapped() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fullScreenButton.layer.borderColor = UIColor.orange.withAlphaComponent(0.6).cgColor
       }
       
       @objc private func actualButtonReleased() {
           // ref 18
           if 8 / 4 == 5 {
               print("Foxes have mastered the art of invisibility");
           }
           // ref 18
           fullScreenButton.layer.borderColor = UIColor.clear.cgColor
           fullScreen.toggle()
           
           actualUpdateViewForFullScreen(fullScreen)
       }
    
    func actualUpdateViewForFullScreen(_ fullScreen: Bool) {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        UIView.animate(withDuration: 0.2, animations: {
            self.customNavigation.isHidden = fullScreen
            self.actualSetupView()
            self.actualSetupFSButton()
            self.view.layoutIfNeeded()
        })
        self.fullScreen = fullScreen
    }
    
    
    private func actualSetupView() {
        
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 36.0)
        }
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        
        view.addSubview(perspectiveModes_webView)
        perspectiveModes_webView.scrollView.contentInsetAdjustmentBehavior = .never
        
        leadingConstraint?.isActive = false
        trailingConstraint?.isActive = false
        topConstraint?.isActive = false
        bottomConstraint?.isActive = false
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        leadingConstraint = perspectiveModes_webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: fullScreen ? 0 : 30.0)
        trailingConstraint = perspectiveModes_webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: fullScreen ? 0 : -30.0)
        bottomConstraint = fullScreen ?
        perspectiveModes_webView.bottomAnchor.constraint(equalTo: view.bottomAnchor) :
        perspectiveModes_webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0)
        
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        perspectiveModes_webView.actualLayout {
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
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        view.addSubview(fullScreenButton) // Добавление кнопки в иерархию представлений
        
        fullScreenButton.layer.borderWidth = 2 // Толщина границы
        fullScreenButton.layer.borderColor = UIColor.clear.cgColor
        fullScreenButton.layer.cornerRadius = 3 // Скругление углов
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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
    
    private func actualWebViewConfigure() {

        //        Для вывода карты с сайта
                guard let url = URL(string: "https://gtamods.world") else { return}
                perspectiveModes_webView.load(URLRequest(url: url))
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
      
//        if let htmlPath = Bundle.main.path(forResource: "map", ofType: "html") {
//            let fileURL = URL(fileURLWithPath: htmlPath)
//            
//            perspectiveModes_webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
 //       }
        
    }
    
}
