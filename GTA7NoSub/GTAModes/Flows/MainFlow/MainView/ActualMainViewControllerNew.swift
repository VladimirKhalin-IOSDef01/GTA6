import UIKit
import Combine

class ActualMainViewControllerNew: ActualNiblessViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: ActualMainModel
    //
    private let menuStackConteinerLeft = UIStackView()
    //
    private let menuStackConteinerRight = UIStackView()
    //
    private let tableView = UITableView(frame: .zero)
    //
    private let tableViewTwo = UITableView(frame: .zero)
    //
    private let customNavigation: ActualCustomNavigation_View
    //
    var alert: UIAlertController?
    
   // var fakeLoader: ActualFakeLoaderController!
    var fakeLoader = ActualFakeLoader()
    
    
    private func actualSetupView() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 35)
            $0.centerX.equal(to: view.centerXAnchor, offsetBy: 20.0)
           // $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
           // $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 36.0)
        }
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        view.addSubview(menuStackConteinerLeft)
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 690).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? -165 : -90),
            menuStackConteinerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        view.addSubview(menuStackConteinerRight)
        menuStackConteinerRight.backgroundColor = .clear  // Color
        menuStackConteinerRight.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerRight.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 690).isActive = true
        menuStackConteinerRight.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerRight.center = CGPoint(x: menuStackConteinerRight.bounds.size.width/2, y: menuStackConteinerRight.bounds.size.height/2)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        NSLayoutConstraint.activate([
            menuStackConteinerRight.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 165 : 90),
            menuStackConteinerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])

        navigationItem.title = ""
        menuStackConteinerLeft.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.tag = 1
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        tableView.actualLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableView.registerReusable_Cell(cellType: ActualMainViewCell.self)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        tableView.delegate = self
        tableView.dataSource = self
        
        
        menuStackConteinerRight.addSubview(tableViewTwo)
        tableViewTwo.backgroundColor = .clear
        tableViewTwo.alwaysBounceVertical = false
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        tableViewTwo.actualLayout {
            $0.top.equal(to: menuStackConteinerRight.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerRight.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerRight.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerRight.bottomAnchor)
        }
        tableViewTwo.registerReusable_Cell(cellType: ActualMainViewCell.self)
        tableViewTwo.tag = 2
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        tableView.clipsToBounds = false
        tableViewTwo.clipsToBounds = false
    }
    
    init(model: ActualMainModel) {
        self.model = model
        self.customNavigation = ActualCustomNavigation_View(.main, titleString: "Menu")
        super.init()
        
        
    }
    
    private func actualSetupBindings() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        model.reloadData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                         self.tableView.reloadData()
                         self.tableViewTwo.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
                self.tableView.reloadData()
                self.tableViewTwo.reloadData()
            self.actualHideSpiner()
        }
    }
    
    override func viewDidLoad() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.viewDidLoad()
        // Отключаем мультитач
        UIView.appearance().isExclusiveTouch = true
        if model.menuItems.isEmpty {
            actualShowSpiner()
        }
        actualSetupView()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualSetupBindings()
    }
    
    private func actualShowSpiner() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
//        alert = UIAlertController(title: nil, message: "Main Loading Data", preferredStyle: .alert)
//       
//        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = .medium
//        loadingIndicator.startAnimating()
//       
//        alert?.view.addSubview(loadingIndicator)
//        present(alert!, animated: true, completion: nil)

        fakeLoader.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
        fakeLoader.modalTransitionStyle = .crossDissolve // Плавное появление
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fakeLoader.setupFakeLoaderView(duration: 2)
        present(fakeLoader, animated: true, completion: nil)
        
        
    }
    private func actualHideSpiner() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        alert?.dismiss(animated: false)
        fakeLoader.dismiss(animated: false)
    }
    
    private func actualHideAlert() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        alert?.dismiss(animated: false)

    }
}

extension ActualMainViewControllerNew: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let cell: ActualMainViewCell = tableView.dequeueReusableCell(indexPath)
        tableView.separatorStyle = .none
            cell.actualConfigure(model.menuItems[indexPath.row], fontSize: 25.0, isLock: false)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
            cell.backgroundColor = .clear
            cell.actualDropShadowStandart(color: .white, opacity: 0.2, offSet: CGSize(width: 0, height: 0), radius: 5)
            cell.isMultipleTouchEnabled = false
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
            return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        return model.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        model.actualSelectedItems(index: indexPath.row)
      /*
        if GTA_NetworkStatusMonitor.shared.isNetworkAvailable {
            self.gta_showMess(message: "No internet \n connection")
        }
        */
        
       // print("INFO: Переход №\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            switch indexPath.row {
            case 0: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
            case 2: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
            default: return 0
            }
        }else {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            switch indexPath.row {
            case 1: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
            case 3: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            default: return 0
            }
        }
    }
}
 

