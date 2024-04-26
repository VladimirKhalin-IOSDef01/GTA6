
import UIKit
import Combine
import Kingfisher
class PerspectiveMainViewController: PerspectiveNiblessViewController {
   
   
    private lazy var menuStack: UIStackView = {
     let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        stack.widthAnchor.constraint(equalToConstant: 345).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 655).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: PerspectiveMainModel
    //
    private let tableView = UITableView(frame: .zero)
    //
    var alert: UIAlertController?
    
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bottomBlackView = UIView()
    private let rightImageView = UIImageView()
    private let lockImageView = UIImageView()
    
    private var lockConstraints: [NSLayoutConstraint] = []
    private var notLockConstraints: [NSLayoutConstraint] = []

    private func perspectiveSetupView() {
  
        navigationItem.title = ""
        perspectiveCreateStack()

       // tableView.rowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 361.0 : 361.0
        
    }
    
    init(model: PerspectiveMainModel) {
        self.model = model
        
        super.init()
    }
    
    private func perspectiveSetupBindings() {
      
        model.reloadData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            self.tableView.reloadData()
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            self.perspectiveHideSpiner()
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
        if model.menuItems.isEmpty {
            perspectiveShowSpinerMain()
        }
        perspectiveSetupView()
        perspectiveSetupBindings()
    }
    
    private func perspectiveShowSpinerMain() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        alert?.view.addSubview(loadingIndicator)
        
        present(alert!, animated: true, completion: nil)
        
    }
    
    private func perspectiveHideSpiner() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        alert?.dismiss(animated: false)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    private func perspectiveCreateStack() {
        let menuStack = createMenuConteiner(width: 345, height: 655)
        let cheatsStack = createMenuConteiner(width: 163, height: 361)
        let mapStack = createMenuConteiner(width: 163, height: 277)
        let checkListStack = createMenuConteiner(width: 163, height: 277)
        let modsStack = createMenuConteiner(width: 163, height: 361)
        
        view.addSubview(menuStack)
        NSLayoutConstraint.activate([
            menuStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        
        
        menuStack.addSubview(cheatsStack)
        NSLayoutConstraint.activate([
            cheatsStack.topAnchor.constraint(equalTo: menuStack.topAnchor, constant: 0),
            cheatsStack.leadingAnchor.constraint(equalTo: menuStack.leadingAnchor, constant: 0)
           
        ])
        cheatsStack.addSubviews()
        
        
        
        menuStack.addSubview(mapStack)
        NSLayoutConstraint.activate([
            mapStack.bottomAnchor.constraint(equalTo: menuStack.bottomAnchor, constant: 0),
            mapStack.leadingAnchor.constraint(equalTo: menuStack.leadingAnchor, constant: 0)
           
        ])
        
        menuStack.addSubview(checkListStack)
        NSLayoutConstraint.activate([
            checkListStack.topAnchor.constraint(equalTo: menuStack.topAnchor, constant: 0),
            checkListStack.trailingAnchor.constraint(equalTo: menuStack.trailingAnchor, constant: 0)
           
        ])
        
        menuStack.addSubview(modsStack)
        NSLayoutConstraint.activate([
            modsStack.bottomAnchor.constraint(equalTo: menuStack.bottomAnchor, constant: 0),
            modsStack.trailingAnchor.constraint(equalTo: menuStack.trailingAnchor, constant: 0)
        ])
        
        model.menuItems.forEach{item in
            
            backgroundImageView.contentMode = .scaleAspectFill
           
            
            
//           let img = createCellButton(item, fontSize: 30, isLock: false)
//
//            NSLayoutConstraint.activate([
//                img.bottomAnchor.constraint(equalTo: cheatsStack.bottomAnchor, constant: 0),
//                img.trailingAnchor.constraint(equalTo: cheatsStack.trailingAnchor, constant: 0)
//            ])
//            
//            
//            cheatsStack.addSubviews(img)
        }
        
        
        
        
    }
    private func createMenuConteiner(width: CGFloat, height: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor  = width > 300 ? .clear : .red
        stack.alignment = .center
        stack.widthAnchor.constraint(equalToConstant: width).isActive = true
        stack.heightAnchor.constraint(equalToConstant: height).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.cornerRadius = 20
        print("INFO: \(model.menuItems.count) объектов в массиве")
        return stack
    }
    
    private func createCellButton(_ value: PerspectiveMain_Item, fontSize: CGFloat, isLock: Bool) -> UIImageView {
        
        
        
        
        titleLabel.text = value.title.uppercased()
        backgroundImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont(name: "Inter-Bold", size: fontSize)
        titleLabel.textColor = .white
        
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        
        
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: "lockIcon") : nil
        
        print("INFO: \(titleLabel)")
     
        return backgroundImageView
    }
    
    private func createButton(index: Int) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
}

