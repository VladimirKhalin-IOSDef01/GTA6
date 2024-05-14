

import UIKit

open class ActualNiblessViewController: UIViewController {
   
    private lazy var waterBackground: UIImageView = {
        let waterBack = UIImageView()
        if  UIDevice.current.userInterfaceIdiom == .pad {
            waterBack.image = UIImage(named: "ActualBackgroubd")
        } else {
            waterBack.image = UIImage(named: "WaterBackground")
        }
        waterBack.contentMode = .scaleToFill
        waterBack.translatesAutoresizingMaskIntoConstraints = false
        waterBack.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        waterBack.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
       return waterBack
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    open override func viewDidLoad() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        super.viewDidLoad()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        
        view.actualSetGradientBackground()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        view.addSubview(waterBackground)
        waterBackground.alpha = 1.0
        
    //    gtavk_setupBackground()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
    }
    
//    private func gtavk_setupBackground() {
//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "bg")
//        backgroundImageView.contentMode = .scaleAspectFill
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//    }
    


}

open class ActualNiblessFilterViewController: UIViewController {
    
    public init() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        return .lightContent
    }
    
    private func actualSetupBackground() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        view.backgroundColor = .black
    }
    
    open override func viewDidLoad() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        super.viewDidLoad()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        actualSetupBackground()
        
    }
}
