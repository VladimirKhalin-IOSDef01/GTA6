
import UIKit
import Combine


class ActualGameCheatsViewController: ActualNiblessViewController {

    var alert: UIAlertController?
    private var subscriptions = Set<AnyCancellable>()
    private let model: ActualGameCheatsModel
    private let collectionView: UICollectionView
    private let customNavigation: ActualCustomNavigation_View
    private var customTabBar: ActualHeaderViewNew
    private let tabBarHight: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 121 : 79
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(model: ActualGameCheatsModel) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        self.model = model
        self.customNavigation = ActualCustomNavigation_View(.gameModes, titleString: model.title)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
       
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
       // layout.headerReferenceSize = CGSize(width: 350, height: tabBarHight) // Установите размер заголовка по вашим нуждам
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        // Закрепление заголовков при прокрутке
       // layout.sectionHeadersPinToVisibleBounds = true
        
       collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        self.customTabBar = ActualHeaderViewNew() // Инициализация без параметров
        super.init()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        customTabBar.actionButton = { [weak self] index in
            self?.model.actualShowCheats(ActualCheatsDeviceType.allCases[index])
            // Перематываем в самое начало.
            let topOffset = CGPoint(x: 0, y: -self!.collectionView.contentInset.top)
            self!.collectionView.setContentOffset(topOffset, animated: true)
        }
        
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackActionProceed()
        }
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.actualFilterActionProceed()
        }
    }

    override func viewDidLoad() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        super.viewDidLoad()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollIndicatorInsets = collectionView.contentInset // Это позволяет полосе прокрутки отображаться корректно
       
      
        if model.cheatItems.isEmpty {
          //  gtavk_showSpiner()   // Отключен в тестовом режиме !!!
        }
        actualSetupView()
        actualSetupBindings()
    }

    private func actualSetupView() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 20)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 36.0)
        }
        
        view.addSubview(customTabBar)
        customTabBar.actualLayout{
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 30)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 94 : 20)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -94 : -20)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 121 : 79)
        }
        
        
        
        
        
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
      //  collectionView.register(ActualHeaderViewNew.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "YourHeaderViewIdentifier")
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActualGameCheatsTabViewCell.self, forCellWithReuseIdentifier: "ActualGameCheatsTabViewCell")
        view.addSubview(collectionView)
        collectionView.actualLayout {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            //$0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 26.0)
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 160.0 : 110)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 94 : 20)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -94 : -20)
            $0.bottom.equal(to: view.bottomAnchor)
        }
    }

    private func actualSetupBindings() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
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
            self.gtavk_hideSpiner()
        }
    }

    private func actualShowSpiner() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.startAnimating()
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        alert?.view.addSubview(loadingIndicator)
        present(alert!, animated: true)
    }

    private func gtavk_hideSpiner() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        alert?.dismiss(animated: false)
    }
}

extension ActualGameCheatsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.cheatItems.count
    }
   
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "YourHeaderViewIdentifier", for: indexPath) as? ActualHeaderViewNew else {
//            fatalError("Failed to dequeue ActualHeaderViewNew")
//        }
//        headerView.actionButton = { [weak self] index in
//            self?.model.actualShowCheats(ActualCheatsDeviceType.allCases[index])
//         // Перематываем в самое начало.
//            let topOffset = CGPoint(x: 0, y: -collectionView.contentInset.top)
//            collectionView.setContentOffset(topOffset, animated: true)
//        }
//        
//        return headerView
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//           // Здесь вы можете задать размеры заголовка для каждой секции
//           return CGSize(width: 250, height: 79)
//       }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
 //       let headerHeight: CGFloat = tabBarHight  // Высота заголовка
 //       let fadeStartPoint: CGFloat = scrollView.contentOffset.y // Позиция на экране, где начинается изменение прозрачности
//        let fadeEndPoint: CGFloat = fadeStartPoint + 30 // Конец зоны изменения прозрачности
//        let cellHeight: CGFloat = 179 // Высота ячейки
//        let interItemSpacing: CGFloat = 15 // Отступ между ячейками
//        let topSpacing: CGFloat = 20 // Отступ от верхнего края до заголовка
        
//        for cell in collectionView.visibleCells {
//            // Используем координаты относительно collectionView, а не superview
//            let cellRect = collectionView.convert(cell.frame, to: collectionView)
//            let cellTopEdge = cellRect.minY
//            // Определение прозрачности на основе положения верхней границы ячейки относительно границы прозрачности
//            let alpha: CGFloat
//            if cellTopEdge >= fadeEndPoint {
//                alpha = 1.0  // Полная непрозрачность
//            } else if cellTopEdge <= fadeStartPoint {
//                alpha = 0.0  // Полная прозрачность
//            } else {
//                // Процесс изменения прозрачности
//                alpha = (cellTopEdge - fadeStartPoint) / (fadeEndPoint - fadeStartPoint)
//            }
//
//            cell.alpha = max(0, min(1, alpha))
//            for subview in cell.contentView.subviews {
//                subview.alpha = cell.alpha
//            }
//        }
         
    }


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActualGameCheatsTabViewCell", for: indexPath) as! ActualGameCheatsTabViewCell
        cell.actualConfigure(with: model.cheatItems[indexPath.row])
        for subview in cell.contentView.subviews {
            subview.alpha = 1.0
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let spacing = 0.0 // Расстояние между ячейками
        let numberOfColumns: CGFloat = 2
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let availableWidth = collectionView.frame.width - (spacing * (numberOfColumns - 1)) - collectionView.contentInset.left - collectionView.contentInset.right
        let widthPerItem = UIDevice.current.userInterfaceIdiom == .pad ? 195 : 163
        return CGSize(width: widthPerItem, height: UIDevice.current.userInterfaceIdiom == .pad ? 220 : 176) // Установите желаемую высоту
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        collectionView.deselectItem(at: indexPath, animated: true)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        model.actualActionAt(index: indexPath.row)
    }
}

//class OffsetHeaderFlowLayout: UICollectionViewFlowLayout {
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attributesArray = super.layoutAttributesForElements(in: rect)
//        
//        attributesArray?.forEach { attributes in
//            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
//                attributes.frame.origin.y -= 10  // Сдвигаем header на 10 пунктов вниз
//            }
//        }
//        
//        return attributesArray
//    }
//}


/*
class ActualGameCheatsViewController: ActualNiblessViewController {

    var alert: UIAlertController?
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: PerspectiveGameCheatsModel
    private let menuStackConteinerLeft = UIStackView()
    private let menuStackConteinerRight = UIStackView()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let tableViewFooter = UITableView(frame: .zero, style: .grouped)
    private let customNavigation: PerspectiveCustomNavigation_View
    private var footer = UIView()
    private var fotterContent = ActualHeaderViewNew()    // !!!

    init(model: PerspectiveGameCheatsModel) {
        self.model = model
        self.customNavigation = PerspectiveCustomNavigation_View(.gameModes, titleString: model.title)
        
        super.init()
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackActionProceed()
        }
        customNavigation.rightButtonAction = { 
            [weak self] in
            self?.model.actualFilterActionProceed()
           // self.gta_changeDevice()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if model.cheatItems.isEmpty {
            actualShowSpiner()
        }
        actualSetupView()
        actualSetupBindings()
    }
    
    private func gtavk_setupView() {
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 36.0)
        }
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.tag = 1
        tableView.perspectiveLayout {
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 36.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 80 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -80 : 0)
            $0.bottom.equal(to: view.bottomAnchor, offsetBy: 0)
        }

        view.addSubview(tableViewFooter)
        tableViewFooter.backgroundColor = .clear
        tableViewFooter.alwaysBounceVertical = false
        tableViewFooter.registerReusableHeaderFooterView(viewType: PerspectiveHeaderViewNew.self)   // !!!
        tableViewFooter.estimatedRowHeight = 0.0
        tableViewFooter.delegate = self
        tableViewFooter.tag = 1

        tableViewFooter.perspectiveLayout{
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 20)
            $0.leading.equal(to: view.leadingAnchor)
            $0.trailing.equal(to: view.trailingAnchor)
            $0.height.equal(to: 150)
        }
        
        tableView.registerReusable_Cell(cellType: ActualMainViewCell.self)
        tableView.registerReusable_Cell(cellType: ActualGameCheatsTabViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func actualSetupBindings() {
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.gtavk_hideSpiner()
        }
    }
    
    private func gtavk_showSpiner() {
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        present(alert!, animated: true, completion: nil)
        
    }
    
    private func gtavk_hideSpiner() {
        alert?.dismiss(animated: false)
    }
    
    
    @objc func gta_changeDevice() {
      //  tableViewFooter.isHidden = false
      //  self.showTabBar.toggle()
    }
}

extension PerspectiveGameCheatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PerspectiveGameCheatsTabViewCell = tableView.dequeueReusableCell(indexPath)
        cell.actualConfigure_cell(model.cheatItems[indexPath.row])
        cell.backgroundColor = .clear
        cell.perspectiveDropShadowStandart()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
           return  model.cheatItems.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 176 : 176
    }
}

extension PerspectiveGameCheatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(viewType: PerspectiveHeaderViewNew.self) // !!!
        headerView?.backgroundColor = .orange
        headerView?.actionButton = { [weak self] index in
            self?.model.perspectiveShowCheats(Cheats_Device_Type.allCases[index])
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 79
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        model.perspectiveActionAt(index: indexPath.row)
    }
}
*/
