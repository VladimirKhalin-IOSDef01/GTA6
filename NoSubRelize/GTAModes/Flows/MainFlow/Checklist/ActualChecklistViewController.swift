

import UIKit
import Combine

class PerspectiveChecklistViewController: PerspectiveNiblessViewController {
    
    var alert: UIAlertController?
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: PerspectiveChecklistModel
    private let tableView = UITableView(frame: .zero)
    private let customNavigation: PerspectiveCustomNavigation_View
    
    var fakeLoader = ActualFakeLoader()
    
    init(model: PerspectiveChecklistModel) {
        self.model = model
        self.customNavigation = PerspectiveCustomNavigation_View(.checkList)
    
        super.init()
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.perspectiveBackAction_Proceeed()
        }
      
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.perspectiveFilterAction_Proceed()
        }
    }
    
    private func perspectiveSetupBindings() {
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }

            self.tableView.reloadData()
            self.perspectiveHideSpiner()
        }
        
    }
    
    private func perspectiveShowSpiner() {
        fakeLoader.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
        fakeLoader.modalTransitionStyle = .crossDissolve // Плавное появление
        fakeLoader.setupFakeLoaderView(duration: 3)
        present(fakeLoader, animated: true, completion: nil)
    }
    
    private func perspectiveHideSpiner() {
        alert?.dismiss(animated: false)
        fakeLoader.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
       // Отключаем мультитач
        disableMultitouchInViewHierarchy(for: self.view)
        
        if model.missionList.isEmpty {
            perspectiveShowSpiner()
        }
        perspectiveSetupView()
        perspectiveSetupBindings()
    }
    
    private func perspectiveSetupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 36.0)
        }
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.perspectiveLayout {
           // $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 743.0 : 0)
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 25.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 100 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -100 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }

        tableView.registerReusable_Cell(cellType: PerspectiveChecklistCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.pinchGestureRecognizer?.isEnabled = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
   // Отключение мультитач
    func disableMultitouchInViewHierarchy(for view: UIView) {
        view.isMultipleTouchEnabled = false
        view.subviews.forEach { subview in
            disableMultitouchInViewHierarchy(for: subview)
        }
    }
}

extension PerspectiveChecklistViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: PerspectiveChecklistCell = tableView.dequeueReusableCell(indexPath)
       
        cell.perspectiveConfigure_cell(model.missionList[indexPath.row])
        cell.backgroundColor = .clear
        cell.perspectiveDropShadowStandart()
        cell.isMultipleTouchEnabled = false
        cell.isCheckAction = { [weak self] isCheck in
            guard let self = self, let indexPath = tableView.indexPath(for: cell) else { return }
            
            self.model.perspectiveMissionIsCheck(indexPath.row, isCheck: isCheck)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return model.missionList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
