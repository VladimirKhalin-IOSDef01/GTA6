
import UIKit
import Combine

class ActualGSViewController: ActualNiblessViewController {

    private var subscriptions = Set<AnyCancellable>()
    private let model: ActualGSModel
    private let tableViewOne = UITableView(frame: .zero)
    private let tableViewTwo = UITableView(frame: .zero)
    private let menuStackConteinerLeft = UIStackView()
    private let menuStackConteinerRight = UIStackView()
    private let customNavigation: ActualCustomNavigation_View
    
    var alert: UIAlertController?

    init(model: ActualGSModel) {
        self.model = model
        self.customNavigation = ActualCustomNavigation_View(.gameSelect)
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.perspectiveBackAction_Proceed()
        }
    }
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
       
    //    setupLoaderView()
  
        if model.menuItems.isEmpty {
    //        actualShowSpiner()        // Отключен в тестовом режиме
        }
        perspectiveSetupView()
        perspectiveGSSetupBindings()
    }
    
    private func perspectiveGSSetupBindings() {
        model.reloadData
          .sink { [weak self] in
            guard let self = self else { return }
            
            self.tableViewOne.reloadData()
          }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableViewOne.reloadData()
            self.tableViewTwo.reloadData()
            self.perspectiveHideSpiner()
        }
    }
    
    private func perspectiveSetupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 20)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 36.0)
        }
        
        view.addSubview(menuStackConteinerLeft)
       // menuStackConteinerLeft.topAnchor.constraint(equalTo: customNavigation.bottomAnchor, constant: 25.0).isActive = true
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 675).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? -160 : -90),
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
        
        menuStackConteinerLeft.addSubview(tableViewOne)
        tableViewOne.backgroundColor = .clear
        tableViewOne.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableViewOne.registerReusable_Cell(cellType: ActualMainViewCell.self)
        tableViewOne.alwaysBounceVertical = false
        tableViewOne.tag = 1
        
        //tableViewOne.rowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 360.0 : 160.0
        tableViewOne.dataSource = self
        tableViewOne.delegate = self
        tableViewOne.separatorStyle = .none
       
        menuStackConteinerRight.addSubview(tableViewTwo)
        tableViewTwo.backgroundColor = .clear
        tableViewTwo.alwaysBounceVertical = false
        
        tableViewTwo.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerRight.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerRight.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerRight.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerRight.bottomAnchor)
        }
        tableViewTwo.registerReusable_Cell(cellType: ActualMainViewCell.self)
        tableViewTwo.tag = 2
        
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
       
        tableViewOne.clipsToBounds = false
        tableViewTwo.clipsToBounds = false

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
        
        alert?.view.addSubview(loadingIndicator)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
    
}

extension ActualGSViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: ActualMainViewCell = tableView.dequeueReusableCell(indexPath)
        cell.perspectiveConfigure(model.menuItems[indexPath.row], fontSize: 26.0, isLock: false)
        cell.backgroundColor = .clear
        cell.perspectiveDropShadowStandart(color: .white, opacity: 0.2, offSet: CGSize(width: 0, height: 0), radius: 5)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
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
      return  model.perspectiveSelectedItems(index: indexPath.row)
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            switch indexPath.row {
            case 0: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            case 2: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
            default: return 0
            }
        }else {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            switch indexPath.row {
            case 1: return UIDevice.current.userInterfaceIdiom == .pad ?  430 : 290
            case 3: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            default: return 0
            }
        }
    }
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    
}
