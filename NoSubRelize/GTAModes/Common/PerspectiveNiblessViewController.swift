

import UIKit

open class PerspectiveNiblessViewController: UIViewController {
   
    private lazy var waterBackground: UIImageView = {
        let waterBack = UIImageView()
        waterBack.image = UIImage(named: "WaterBackground")
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
        
        view.setGradientBackground()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        view.addSubview(waterBackground)
        waterBackground.alpha = 1.0
        
      //  gtavk_setupBackground()
        
    }
    
//    private func gtavk_setupBackground() {
//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "bg")
//        backgroundImageView.contentMode = .scaleAspectFill
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//    }
    


}

open class Nibless_Filter_ViewController: UIViewController {
    
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
    
    private func perspectiveSetupBackground() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        view.backgroundColor = .black
    }
    
    open override func viewDidLoad() {
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
        perspectiveSetupBackground()
        
    }
}
