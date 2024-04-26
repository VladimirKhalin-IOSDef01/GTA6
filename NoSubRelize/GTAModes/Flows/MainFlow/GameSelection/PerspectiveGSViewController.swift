
import UIKit
import Combine

class PerspectiveGSViewController: PerspectiveNiblessViewController {

    private var subscriptions = Set<AnyCancellable>()
    private let model: PerspectiveGSModel
    private let tableViewOne = UITableView(frame: .zero)
    private let tableViewTwo = UITableView(frame: .zero)
    private let menuStackConteinerLeft = UIStackView()
    private let menuStackConteinerRight = UIStackView()
    private let customNavigation: PerspectiveCustomNavigation_View
    
    var alert: UIAlertController?
    
    init(model: PerspectiveGSModel) {
        self.model = model
        self.customNavigation = PerspectiveCustomNavigation_View(.gameSelect)
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.perspectiveBackAction_Proceed()
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
            perspectiveShowSpiner()
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
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 36.0)
        }
        
        view.addSubview(menuStackConteinerLeft)
       // menuStackConteinerLeft.topAnchor.constraint(equalTo: customNavigation.bottomAnchor, constant: 25.0).isActive = true
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 265 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: 675).isActive = true
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
        
        menuStackConteinerLeft.addSubview(tableViewOne)
        tableViewOne.backgroundColor = .clear
        tableViewOne.perspectiveLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableViewOne.registerReusable_Cell(cellType: PerspectiveMainViewCell.self)
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

extension PerspectiveGSViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: PerspectiveMainViewCell = tableView.dequeueReusableCell(indexPath)
        cell.perspectiveConfigure(model.menuItems[indexPath.row], fontSize: 24.0, isLock: false)
        cell.backgroundColor = .clear
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
            case 0: return 378     // было  163 х 361    стало: 269 х 361
            case 2: return 290     // было  163 х 277    стало: 269 х 277
            default: return 0
            }
        }else {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            switch indexPath.row {
            case 1: return 290     // было      стало:
            case 3: return 378     // было      стало:
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
