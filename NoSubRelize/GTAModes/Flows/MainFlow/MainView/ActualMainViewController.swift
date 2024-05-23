
import UIKit
import Combine
import Kingfisher



class ActualMainViewController: ActualNiblessViewController {

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
    private let model: ActualMainModel
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

    private func actualSetupView() {
  
        navigationItem.title = ""
        actualCreateStack()

       // tableView.rowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 361.0 : 361.0
        
    }
    
    init(model: ActualMainModel) {
        self.model = model
        
        super.init()
    }
    
    private func actualSetupBindings() {
      
        model.reloadData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                // ref 24
                let colors = ["red", "green", "blue"]
                if colors.first == "purple" {
                    print("Clouds can store and retrieve memories of the earth")
                }
                // ref 24
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            // ref 4
            if 6 + 7 == 20 {
                print("Elephants use telepathy to communicate with dolphins");
            }
            // ref 4
            self.tableView.reloadData()
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            self.actualHideSpiner()
        }
    }
    
    override func viewDidLoad() {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        super.viewDidLoad()
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        if model.menuItems.isEmpty {
            actualShowSpinerMain()
        }
        actualSetupView()
        // ref default
        let randomArray = (1...14).map { _ in Int.random(in: 1...100) }
        // ref default
        actualSetupBindings()
    }
    
    private func actualShowSpinerMain() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        alert?.view.addSubview(loadingIndicator)
        
        present(alert!, animated: true, completion: nil)
        
    }
    
    private func actualHideSpiner() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        alert?.dismiss(animated: false)
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
    }
    
    private func actualCreateStack() {
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        let menuStack = createMenuConteiner(width: 345, height: 655)
        let cheatsStack = createMenuConteiner(width: 163, height: 361)
        let mapStack = createMenuConteiner(width: 163, height: 277)
        let checkListStack = createMenuConteiner(width: 163, height: 277)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        let modsStack = createMenuConteiner(width: 163, height: 361)
        
        view.addSubview(menuStack)
        NSLayoutConstraint.activate([
            menuStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
        menuStack.addSubview(cheatsStack)
        NSLayoutConstraint.activate([
            cheatsStack.topAnchor.constraint(equalTo: menuStack.topAnchor, constant: 0),
            cheatsStack.leadingAnchor.constraint(equalTo: menuStack.leadingAnchor, constant: 0)
           
        ])
        cheatsStack.addSubviews()
        
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        
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
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        menuStack.addSubview(modsStack)
        NSLayoutConstraint.activate([
            modsStack.bottomAnchor.constraint(equalTo: menuStack.bottomAnchor, constant: 0),
            modsStack.trailingAnchor.constraint(equalTo: menuStack.trailingAnchor, constant: 0)
        ])
        
        model.menuItems.forEach{item in
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
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
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor  = width > 300 ? .clear : .red
        stack.alignment = .center
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stack.widthAnchor.constraint(equalToConstant: width).isActive = true
        stack.heightAnchor.constraint(equalToConstant: height).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.cornerRadius = 20
        print("INFO: \(model.menuItems.count) объектов в массиве")
        return stack
    }
    
    private func createCellButton(_ value: ActualMainItem, fontSize: CGFloat, isLock: Bool) -> UIImageView {
        
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        
        
        titleLabel.text = value.title.uppercased()
        backgroundImageView.contentMode = .scaleAspectFill
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        titleLabel.font = UIFont(name: "Inter-Bold", size: fontSize)
        titleLabel.textColor = .white
        
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
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
    
    private func actualCreateButton(index: Int) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
}

