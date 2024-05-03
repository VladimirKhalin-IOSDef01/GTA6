import UIKit
import Combine

class PerspectiveMainViewControllerNew: PerspectiveNiblessViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: PerspectiveMainModel
    //
    private let menuStackConteinerLeft = UIStackView()
    //
    private let menuStackConteinerRight = UIStackView()
    //
    private let tableView = UITableView(frame: .zero)
    //
    private let tableViewTwo = UITableView(frame: .zero)
    //
    private let customNavigation: PerspectiveCustomNavigation_View
    //
    var alert: UIAlertController?
    
   // var fakeLoader: ActualFakeLoaderController!
    var fakeLoader = ActualFakeLoader()
    
    
    private func perspectiveSetupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 40)
            $0.centerX.equal(to: view.centerXAnchor, offsetBy: 20.0)
           // $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
           // $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 36.0)
        }

        view.addSubview(menuStackConteinerLeft)
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 670).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? -165 : -90),
            menuStackConteinerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])
        
        view.addSubview(menuStackConteinerRight)
        menuStackConteinerRight.backgroundColor = .clear  // Color
        menuStackConteinerRight.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerRight.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 670).isActive = true
        menuStackConteinerRight.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerRight.center = CGPoint(x: menuStackConteinerRight.bounds.size.width/2, y: menuStackConteinerRight.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerRight.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 165 : 90),
            menuStackConteinerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])

        navigationItem.title = ""
        menuStackConteinerLeft.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.tag = 1
        
        tableView.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableView.registerReusable_Cell(cellType: PerspectiveMainViewCell.self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        menuStackConteinerRight.addSubview(tableViewTwo)
        tableViewTwo.backgroundColor = .clear
        tableViewTwo.alwaysBounceVertical = false
        
        tableViewTwo.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerRight.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerRight.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerRight.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerRight.bottomAnchor)
        }
        tableViewTwo.registerReusable_Cell(cellType: PerspectiveMainViewCell.self)
        tableViewTwo.tag = 2
        
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
        
        tableView.clipsToBounds = false
        tableViewTwo.clipsToBounds = false
    }
    
    init(model: PerspectiveMainModel) {
        self.model = model
        self.customNavigation = PerspectiveCustomNavigation_View(.main, titleString: "Menu")
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
                         self.tableViewTwo.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
                self.tableView.reloadData()
                self.tableViewTwo.reloadData()
            self.perspectiveHideSpiner()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Отключаем мультитач
        UIView.appearance().isExclusiveTouch = true
        if model.menuItems.isEmpty {
            perspectiveShowSpiner()
        }
        perspectiveSetupView()
        perspectiveSetupBindings()
    }
    
    private func perspectiveShowSpiner() {
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
        fakeLoader.setupFakeLoaderView(duration: 2)
        present(fakeLoader, animated: true, completion: nil)
        
        
    }
    private func perspectiveHideSpiner() {
        alert?.dismiss(animated: false)
        fakeLoader.dismiss(animated: false)
    }
    
    private func perspectiveHideAlert() {
        alert?.dismiss(animated: false)

    }
}

extension PerspectiveMainViewControllerNew: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: PerspectiveMainViewCell = tableView.dequeueReusableCell(indexPath)
            cell.perspectiveConfigure(model.menuItems[indexPath.row], fontSize: 25.0, isLock: false)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
            cell.backgroundColor = .clear
            cell.perspectiveDropShadowStandart(color: .white, opacity: 0.2, offSet: CGSize(width: 0, height: 0), radius: 5)
            cell.isMultipleTouchEnabled = false
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
            return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return model.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        model.perspectiveSelectedItems(index: indexPath.row)
      /*
        if GTA_NetworkStatusMonitor.shared.isNetworkAvailable {
            self.gta_showMess(message: "No internet \n connection")
        }
        */
        
       // print("INFO: Переход №\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            switch indexPath.row {
            case 0: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            case 2: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
            default: return 0
            }
        }else {
            switch indexPath.row {
            case 1: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
            case 3: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            default: return 0
            }
        }
    }
}
 

