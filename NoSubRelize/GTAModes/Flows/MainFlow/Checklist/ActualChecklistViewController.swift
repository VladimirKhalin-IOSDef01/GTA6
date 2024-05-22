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
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        self.model = model
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = UIDevice.current.userInterfaceIdiom == .pad ? 15 : 0
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.customNavigation = ActualCustomNavigation_View(.checkList)
    
        super.init()
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackActionProceeed()
        }
      
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.actualFilterActionProceed()
        }
    }
    
    private func actualSetupBindings() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        fakeLoader.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
        fakeLoader.modalTransitionStyle = .crossDissolve // Плавное появление
        fakeLoader.setupFakeLoaderView(duration: 3)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        present(fakeLoader, animated: true, completion: nil)
    }
    
    private func actualHideSpiner() {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        alert?.dismiss(animated: false)
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        fakeLoader.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        super.viewDidLoad()
       
        // Отключаем мультитач
        actualDisableMultitouchInViewHierarchy(for: self.view)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        if model.missionList.isEmpty {
            actualShowSpiner()
        }
        actualSetupView()
        actualSetupBindings()
    }
    
    private func actualSetupView() {
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
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
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // Отключение мультитач
    func actualDisableMultitouchInViewHierarchy(for view: UIView) {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        view.isMultipleTouchEnabled = false
        view.subviews.forEach { subview in
            actualDisableMultitouchInViewHierarchy(for: subview)
        }
    }
}

extension ActualChecklistViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActualChecklistCell", for: indexPath)
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        if let checklistCell = cell as? ActualChecklistCell {
            checklistCell.actualConfigure_cell(model.missionList[indexPath.item])
            checklistCell.backgroundColor = .clear
            checklistCell.actualDropShadowStandart()
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            checklistCell.isMultipleTouchEnabled = false
            checklistCell.isCheckAction = { [weak self] isCheck in
                guard let self = self else { return }
                self.model.actualMissionIsCheck(indexPath.item, isCheck: isCheck)
            }
        }
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        return model.missionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
           return UIDevice.current.userInterfaceIdiom == .pad ? 15 : 0 // Задает промежуток между ячейками
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        let padding: CGFloat = 0 // отступ между ячейками
        let collectionViewSize = collectionView.frame.size.width - padding
       // let cellWidth = collectionViewSize / 2
        let cellWidth = UIDevice.current.userInterfaceIdiom == .pad ? 221 : 163
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        return CGSize(width: cellWidth, height: UIDevice.current.userInterfaceIdiom == .pad ? 125 : 105) // высоту ячейки укажите в зависимости от вашего дизайна
    }
}
