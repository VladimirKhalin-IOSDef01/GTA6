import UIKit
import Combine

class ActualChecklistViewController: ActualNiblessViewController {
    
    var alert: UIAlertController?
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: ActualChecklistModel
    private let collectionView: UICollectionView
    private let customNavigation: ActualCustomNavigation_View
    
    var fakeLoader = ActualFakeLoader()
    
    init(model: ActualChecklistModel) {
        self.model = model
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.customNavigation = ActualCustomNavigation_View(.checkList)
    
        super.init()
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackActionProceeed()
        }
      
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.actualFilterActionProceed()
        }
    }
    
    private func actualSetupBindings() {
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                self.collectionView.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }

            self.collectionView.reloadData()
            self.actualHideSpiner()
        }
    }
    
    private func actualShowSpiner() {
        fakeLoader.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
        fakeLoader.modalTransitionStyle = .crossDissolve // Плавное появление
        fakeLoader.setupFakeLoaderView(duration: 3)
        present(fakeLoader, animated: true, completion: nil)
    }
    
    private func actualHideSpiner() {
        alert?.dismiss(animated: false)
        fakeLoader.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Отключаем мультитач
        actualDisableMultitouchInViewHierarchy(for: self.view)
        
        if model.missionList.isEmpty {
            actualShowSpiner()
        }
        actualSetupView()
        actualSetupBindings()
    }
    
    private func actualSetupView() {
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 :-20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 36.0)
        }
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActualChecklistCell.self, forCellWithReuseIdentifier: "ActualChecklistCell") // Здесь регистрируем ячейку
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // добавляем отступы справа и слева
        view.addSubview(collectionView)
        collectionView.actualLayout {
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 25.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 25.0 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -25.0 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // Отключение мультитач
    func actualDisableMultitouchInViewHierarchy(for view: UIView) {
        view.isMultipleTouchEnabled = false
        view.subviews.forEach { subview in
            actualDisableMultitouchInViewHierarchy(for: subview)
        }
    }
}

extension ActualChecklistViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActualChecklistCell", for: indexPath)
        
        if let checklistCell = cell as? ActualChecklistCell {
            checklistCell.actualConfigure_cell(model.missionList[indexPath.item])
            checklistCell.backgroundColor = .clear
            checklistCell.actualDropShadowStandart()
            checklistCell.isMultipleTouchEnabled = false
            checklistCell.isCheckAction = { [weak self] isCheck in
                guard let self = self else { return }
                self.model.actualMissionIsCheck(indexPath.item, isCheck: isCheck)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.missionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 0 // отступ между ячейками
        let collectionViewSize = collectionView.frame.size.width - padding
       // let cellWidth = collectionViewSize / 2
        let cellWidth = UIDevice.current.userInterfaceIdiom == .pad ? 221 : 163
        return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 125 : 105) // высоту ячейки укажите в зависимости от вашего дизайна
    }
}
