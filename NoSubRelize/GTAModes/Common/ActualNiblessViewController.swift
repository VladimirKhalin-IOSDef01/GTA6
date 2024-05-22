

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
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        
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
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        
        return .lightContent
    }
    
    private func actualSetupBackground() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
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
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        
        actualSetupBackground()
        
    }
}
