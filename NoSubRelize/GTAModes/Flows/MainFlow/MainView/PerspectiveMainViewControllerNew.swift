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
    var alert: UIAlertController?
    //
    private func perspectiveSetupView() {
        view.addSubview(menuStackConteinerLeft)
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 265 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: 670).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? -140 : -90),
            menuStackConteinerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])
        
        view.addSubview(menuStackConteinerRight)
        menuStackConteinerRight.backgroundColor = .clear  // Color
        menuStackConteinerRight.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 265 : 165).isActive = true
        menuStackConteinerRight.heightAnchor.constraint(equalToConstant: 670).isActive = true
        menuStackConteinerRight.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerRight.center = CGPoint(x: menuStackConteinerRight.bounds.size.width/2, y: menuStackConteinerRight.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerRight.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 140 : 90),
            menuStackConteinerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])

        navigationItem.title = ""
        menuStackConteinerLeft.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.tag = 1
        
        tableView.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: 0.0)
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
            $0.top.equal(to: menuStackConteinerRight.safeAreaLayoutGuide.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: menuStackConteinerRight.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerRight.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerRight.bottomAnchor)
        }
        tableViewTwo.registerReusable_Cell(cellType: PerspectiveMainViewCell.self)
        tableViewTwo.tag = 2
        
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
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
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
    
    private func perspectiveHideAlert() {
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
            cell.perspectiveDropShadowStandart()
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
            case 0: return 378 //
            case 2: return 290 //277
            default: return 0
            }
        }else {
            switch indexPath.row {
            case 1: return 290
            case 3: return 378
            default: return 0
            }
        }
    }
}
 

