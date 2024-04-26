
import UIKit
import Combine

class PerspectiveGameCheatsViewController: PerspectiveNiblessViewController {
    
  
    
    var alert: UIAlertController?
   
    var showTabBar = false
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: PerspectiveGameCheatsModel
    //
    private let menuStackConteinerLeft = UIStackView()
    //
    private let menuStackConteinerRight = UIStackView()
    //
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let tableViewFooter = UITableView(frame: .zero, style: .grouped)
    //
    private let customNavigation: PerspectiveCustomNavigation_View
    //
    private var footer = UIView()
    //
    private var fotterContent = PerspectiveHeaderView()
    

    
    init(model: PerspectiveGameCheatsModel) {
        self.model = model
        self.customNavigation = PerspectiveCustomNavigation_View(.gameModes, titleString: model.title)
        
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.perspectiveBackAction_Proceed()
        }
        customNavigation.rightButtonAction = { 
           // [weak self] in
           // self?.model.gtavk_filterAction_Proceed()
            self.gta_changeDevice()
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
        
        if model.cheatItems.isEmpty {
            gtavk_showSpiner()
        }
        gtavk_setupView()
        gtavk_setupBindings()
    }
    
    private func gtavk_setupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 36.0)
        }
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.tag = 1
        tableView.perspectiveLayout {
          //  $0.top.equal(to: searchContainer.bottomAnchor, offsetBy: 8.0)
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 16.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 80 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -80 : 0)
            $0.bottom.equal(to: view.bottomAnchor, offsetBy: 0)
             
        //    $0.bottom.equal(to: tableView.tableFooterView?.topAnchor)
          
        }

        view.addSubview(tableViewFooter)
        tableViewFooter.isHidden = self.showTabBar ? false : true
        tableViewFooter.backgroundColor = UIColor(named: "tapbarcolor")?.withAlphaComponent(0.95)
        tableViewFooter.alwaysBounceVertical = false
        tableViewFooter.registerReusableHeaderFooterView(viewType: PerspectiveHeaderView.self)
        tableViewFooter.estimatedRowHeight = 0.0
      //  tableViewFooter.dataSource = self
        tableViewFooter.delegate = self
        tableViewFooter.tag = 2

        tableViewFooter.perspectiveLayout{
           // $0.top.equal(to: tableView.bottomAnchor, offsetBy: 10)
            $0.leading.equal(to: view.leadingAnchor)
            $0.trailing.equal(to: view.trailingAnchor)
            $0.height.equal(to: 120)
            $0.bottom.equal(to: view.bottomAnchor, offsetBy: 45)
        }
        
        tableView.registerReusable_Cell(cellType: PerspectiveMainViewCell.self)
        tableView.registerReusable_Cell(cellType: PerspectiveGameCheatsTabViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
       // tableView.estimatedRowHeight = 100.0
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func gtavk_setupBindings() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                
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
            self.gtavk_hideSpiner()
        }
    }
    
    private func gtavk_showSpiner() {
  
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
    
    private func gtavk_hideSpiner() {
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
    
    
    @objc func gta_changeDevice() {
        tableViewFooter.isHidden = showTabBar ? true : false
        self.showTabBar.toggle()
    }
}

extension PerspectiveGameCheatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: PerspectiveGameCheatsTabViewCell = tableView.dequeueReusableCell(indexPath)
        cell.perspectiveConfigure_cell(model.cheatItems[indexPath.row])
        cell.backgroundColor = .clear
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        cell.perspectiveDropShadowStandart()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if tableView.tag == 1 {
           return  model.cheatItems.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return UIDevice.current.userInterfaceIdiom == .pad ? 160 : 100
    }
    
    
}

extension PerspectiveGameCheatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let headerView = tableView.dequeueReusableHeaderFooterView(viewType: PerspectiveHeaderView.self)
        headerView?.backgroundColor = .orange
        headerView?.actionButton = { [weak self] index in
            self?.model.perspectiveShowCheats(Cheats_Device_Type.allCases[index])
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if tableView.tag == 2 {
            return 45
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        tableView.deselectRow(at: indexPath, animated: true)
        model.perspectiveActionAt(index: indexPath.row)
    }
    
}
