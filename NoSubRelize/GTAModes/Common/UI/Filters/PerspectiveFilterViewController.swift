//
//  FilterViewController.swift
//  GTAModes
//
//  Created by Максим Педько on 30.07.2023.
//

import Foundation
import UIKit

public struct perspectiveFilter_Data {
    
    public let title: String
    public var isCheck: Bool
    
}

public class PanDrag_Indicator: PerspectiveNiblessView {
    
    public static let height = 4.0
    
    public override init() {
        super.init()
        
        gtavk_setupView()
    }
    
    private func gtavk_setupView() {
        withCornerRadius(Self.height / 2.0)
        perspectiveLayout {
            $0.width.equal(to: 32.0)
            $0.height.equal(to: PanDrag_Indicator.height)
        }
        backgroundColor = .gray
    }
}

protocol Filter_NavigationHandler: AnyObject {
    
    func filterDidRequestToClose()
}

// Добавьте делегат для уведомления о изменении состояния переключателя
protocol PerspectiveFilterTabViewCellDelegate: AnyObject {
    func toggleTapped(_ cell: PerspectiveFilterTabViewCell)
}

final class PerspectiveFilterViewController: Nibless_Filter_ViewController {
    
    public var selectedFilter: (String) -> ()
    private let colorConteiner = UIView()
    private var filterListData: GTAVK_FilterList_Data
    private let tableView = UITableView(frame: .zero)
    private let titleLabel = UILabel()
    private let closeButton = UIButton()
    private let navigationHandler: Filter_NavigationHandler
    private var selectedValue: String
    
    
    public init(
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> (),
        navigationHandler: Filter_NavigationHandler
    ) {
        self.filterListData = filterListData
        self.selectedFilter = selectedFilter
        self.selectedValue = filterListData.selectedItem
        self.navigationHandler = navigationHandler
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
       
        perspectiveSetupView()
    }
    
    private func perspectiveSetupView() {

        let actualHeight = (filterListData.filterList.count + 1) * 70
        
        view.withCornerRadius()
       // view.alpha = 0.75
        view.backgroundColor = UIColor(named: "modalColor")?.withAlphaComponent(0.7)
        view.backgroundColor = .clear
        view.isOpaque = false

        view.addSubviews(colorConteiner)
        colorConteiner.backgroundColor = .white
        colorConteiner.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.5))
        colorConteiner.withCornerRadius(20)
        colorConteiner.perspectiveLayout{
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 120 : 20)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -120 : -20)
            $0.top.equal(to: view.topAnchor, offsetBy: 0)
            //$0.bottom.greaterThanOrEqual(to: view.bottomAnchor)
            //$0.bottom.equal(to: colorConteiner.topAnchor, offsetBy: tableView.frame.height)
            $0.bottom.equal(to: view.topAnchor, offsetBy: CGFloat(actualHeight))
        }

        titleLabel.text = "Filter"
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: 20)
        titleLabel.textColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.centerX.equal(to: view.centerXAnchor)
            $0.top.equal(to: view.topAnchor, offsetBy: 24.0)
        }
        
        view.addSubview(closeButton)
        closeButton.clipsToBounds = true
        closeButton.sizeToFit()
        closeButton.perspectiveLayout {
            $0.trailing.equal(to: colorConteiner.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -30 : -20.0)
            $0.centerY.equal(to: titleLabel.centerYAnchor)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 24.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 24.0)
        }
        closeButton.setImage(UIImage(named: "closeIcon"), for: .normal)
        closeButton.addTarget(self, action: #selector(perspectiveCloseAction), for: .touchUpInside)
        if let closeImage = UIImage(named: "closeIcon")?.withRenderingMode(.alwaysTemplate) {
            closeButton.setImage(closeImage, for: .normal)
            closeButton.tintColor = UIColor.black
        }
        
        tableView.accessibilityIdentifier = "tableView"
        view.addSubview(tableView)
        tableView.perspectiveLayout {
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 120 : 20)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -120 : -20)
            $0.top.equal(to: titleLabel.bottomAnchor)
            $0.bottom.equal(to: view.safeAreaLayoutGuide.bottomAnchor, priority: .defaultLow)
        }
        tableView.backgroundColor = .clear
        tableView.sectionFooterHeight = 0.0
        tableView.rowHeight = 70.0
        tableView.registerReusable_Cell(cellType: PerspectiveFilterTabViewCell.self)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        
       
    }
    
    @objc
    func perspectiveCloseAction() {
        navigationHandler.filterDidRequestToClose()
    }
    
}

extension PerspectiveFilterViewController: PerspectivePPresentable {
    
    private var contentSize: CGSize {
        CGSize(
            width: view.frame.width,
            height: UIDevice.current.userInterfaceIdiom == .pad ? 800.0 : 600
        )
    }
    
    func minContentHeight(presentingController: UIViewController) -> CGFloat {
        return contentSize.height
    }
    
    func maxContentHeight(presentingController: UIViewController) -> CGFloat {
        return contentSize.height
    }
    
}

extension PerspectiveFilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterListData.filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PerspectiveFilterTabViewCell = tableView.dequeueReusableCell(indexPath)
        let titleCell = filterListData.filterList[indexPath.row]
        let filterDataCell = perspectiveFilter_Data(title: titleCell, isCheck: perspectiveFilterIsCheckFilter(titleCell) )
        cell.perspectiveConfigure_cell(filterDataCell)
        cell.delegate = self
       // cell.switcher.isOn = filterDataCell.isCheck
        cell.backgroundColor = .clear
        return cell
    }
    
    private func perspectiveFilterIsCheckFilter(_ titleCell: String) -> Bool {
        if titleCell == filterListData.selectedItem, titleCell == selectedValue {
            return true
        }
        
        if titleCell == filterListData.selectedItem, titleCell != selectedValue {
            return false
        }
        
        if titleCell != filterListData.selectedItem, titleCell == selectedValue {
            return true
        }
        
        return false
    }
    
}

extension PerspectiveFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedValue == filterListData.filterList[indexPath.row] {
            selectedValue = ""
            selectedFilter("")
        } else {
            selectedValue = filterListData.filterList[indexPath.row]
            selectedFilter(selectedValue)
        }
        tableView.reloadData()
    }
}

extension PerspectiveFilterViewController: PerspectiveFilterTabViewCellDelegate {
    
    
    func toggleTapped(_ cell: PerspectiveFilterTabViewCell) {
        // Получаем indexPath выбранной ячейки
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        

    }
}




