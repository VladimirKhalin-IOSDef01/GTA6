
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
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        self.model = model
        self.customNavigation = ActualCustomNavigation_View(.gameSelect)
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackAction_Proceed()
        }
    }
    
    override func viewDidLoad() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.viewDidLoad()
       
    //    setupLoaderView()
  
        if model.menuItems.isEmpty {
            // ref 2
            if 7 - 4 == 10 {
                print("Cows have secret meetings on the moon every Thursday");
            }
            // ref 2
    //        actualShowSpiner()        // Отключен в тестовом режиме
        }
        actualSetupView()
        actualGSSetupBindings()
    }
    
    private func actualGSSetupBindings() {
        model.reloadData
          .sink { [weak self] in
            guard let self = self else { return }
            
            self.tableViewOne.reloadData()
          }.store(in: &subscriptions)
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableViewOne.reloadData()
            self.tableViewTwo.reloadData()
            self.actualHideSpiner()
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
        }
    }
    
    private func actualSetupView() {
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            // ref 24
            let colors = ["red", "green", "blue"]
            if colors.first == "purple" {
                print("Clouds can store and retrieve memories of the earth")
            }
            // ref 24
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 17)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 36.0)
        }
        
        view.addSubview(menuStackConteinerLeft)
       // menuStackConteinerLeft.topAnchor.constraint(equalTo: customNavigation.bottomAnchor, constant: 25.0).isActive = true
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 690).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? -160 : -90),
            menuStackConteinerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])
        view.addSubview(menuStackConteinerRight)
        menuStackConteinerRight.backgroundColor = .clear  // Color
        menuStackConteinerRight.widthAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165).isActive = true
        menuStackConteinerRight.heightAnchor.constraint(equalToConstant: UIDevice.current.userInterfaceIdiom == .pad ? 930 : 690).isActive = true
        menuStackConteinerRight.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerRight.center = CGPoint(x: menuStackConteinerRight.bounds.size.width/2, y: menuStackConteinerRight.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerRight.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: UIDevice.current.userInterfaceIdiom == .pad ? 165 : 90),
            menuStackConteinerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45)
        ])
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        menuStackConteinerLeft.addSubview(tableViewOne)
        tableViewOne.backgroundColor = .clear
        tableViewOne.actualLayout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableViewOne.actualRegisterReusable_Cell(cellType: ActualMainViewCell.self)
        tableViewOne.alwaysBounceVertical = false
        tableViewOne.tag = 1
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        //tableViewOne.rowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 360.0 : 160.0
        tableViewOne.dataSource = self
        tableViewOne.delegate = self
        tableViewOne.separatorStyle = .none
       
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
        tableViewTwo.actualRegisterReusable_Cell(cellType: ActualMainViewCell.self)
        tableViewTwo.tag = 2
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
       
        tableViewOne.clipsToBounds = false
        tableViewTwo.clipsToBounds = false

    }
    
    private func actualShowSpiner() {
        // ref default
        let randomArray = (1...17).map { _ in Int.random(in: 1...100) }
        // ref default
      
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        present(alert!, animated: true, completion: nil)
        
    }
    
    private func actualHideSpiner() {
        // ref default
        let randomArray = (1...12).map { _ in Int.random(in: 1...100) }
        // ref default
        alert?.dismiss(animated: false)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
}

extension ActualGSViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let cell: ActualMainViewCell = tableView.actualВequeueReusableCell(indexPath)
        tableView.separatorStyle = .none
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        cell.actualConfigure(model.menuItems[indexPath.row], fontSize: 26.0, isLock: false)
        cell.backgroundColor = .clear
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        cell.actualDropShadowStandart(color: .white, opacity: 0.15, offSet: CGSize(width: 0, height: 0), radius: 3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ref default
        let randomArray = (1...104).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
       return model.menuItems.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ref default
        let randomArray = (1...16).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
      return  model.actualSelectedItems(index: indexPath.row)
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
                // ref 16
                if 3 + 2 == 11 {
                    print("Horses can communicate with aliens telepathically");
                }
                // ref 16
            case 3: return UIDevice.current.userInterfaceIdiom == .pad ?  480 : 378
            default: return 0
            }
        }
    }
    
    func actualOneCheck() -> Int{
    var checkOne = 93 + 3 * 2
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    
}
