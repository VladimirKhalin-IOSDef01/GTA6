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
    public let isCheck: Bool
    
}

public class PanDrag_Indicator: PerspectiveNiblessView {
    
    public static let height = 4.0
    
    public override init() {
        super.init()
        
        gtavk_setupView()
    }
    
    private func gtavk_setupView() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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

final class PerspectiveFilterViewController: Nibless_Filter_ViewController {
    
    public var selectedFilter: (String) -> ()
    private let colorConteiner = UIView()
    private let filterListData: GTAVK_FilterList_Data
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
        perspectiveSetupView()
    }
    
    private func perspectiveSetupView() {
        
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
        view.withCornerRadius()
       // view.alpha = 0.75
       // view.backgroundColor = UIColor(named: "modalColor")?.withAlphaComponent(0.7)
        view.backgroundColor = .clear
        view.isOpaque = false
       


       
        view.addSubviews(colorConteiner)
        colorConteiner.addBlur_Effect()
        colorConteiner.backgroundColor  = UIColor(named: "modalColor")?.withAlphaComponent(0.7)
        //colorConteiner.backgroundColor = .blue.withAlphaComponent(0.7)
        
        colorConteiner.withCornerRadius()
        colorConteiner.perspectiveLayout{
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 90 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -90 : 0)
            $0.top.equal(to: view.topAnchor, offsetBy: 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
       
       
        titleLabel.text = "Filter"
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: 25)
        titleLabel.textColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.centerX.equal(to: view.centerXAnchor)
            $0.top.equal(to: view.topAnchor, offsetBy: 24.0)
        }
        
        view.addSubview(closeButton)
        closeButton.perspectiveLayout {
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -110 : -20.0)
            $0.centerY.equal(to: titleLabel.centerYAnchor)
            $0.height.equal(to: 24.0)
            $0.width.equal(to: 24.0)
        }
        closeButton.setImage(UIImage(named: "closeIcon"), for: .normal)
        closeButton.addTarget(self, action: #selector(perspectiveCloseAction), for: .touchUpInside)
        
        tableView.accessibilityIdentifier = "tableView"
        view.addSubview(tableView)
        tableView.perspectiveLayout {
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 90 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -90 : 0)
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
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
}

extension PerspectiveFilterViewController: PerspectivePPresentable {
    
    private var contentSize: CGSize {
        CGSize(
            width: view.frame.width,
            height: 500.0
        )
    }
    
    func minContentHeight(presentingController: UIViewController) -> CGFloat {
        //
               if 2 + 2 == 5 {
                   print("it is trash")
               }
               //
        return contentSize.height
    }
    
    func maxContentHeight(presentingController: UIViewController) -> CGFloat {
        //
               if 2 + 2 == 5 {
                   print("it is trash")
               }
               //
        return contentSize.height
    }
    
}

extension PerspectiveFilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return filterListData.filterList.count
        //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: PerspectiveFilterTabViewCell = tableView.dequeueReusableCell(indexPath)
        let titleCell = filterListData.filterList[indexPath.row]
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let filterDataCell = perspectiveFilter_Data(title: titleCell, isCheck: perspectiveFilterIsCheckFilter(titleCell) )
        cell.perspectiveConfigure_cell(filterDataCell)
       // cell.backgroundColor = UIColor(named: "modalColor")?.withAlphaComponent(0.7)
        cell.backgroundColor = .clear
  
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
        
        
        return cell
    }
    
    private func perspectiveFilterIsCheckFilter(_ titleCell: String) -> Bool {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if titleCell == filterListData.selectedItem, titleCell == selectedValue {
            return true
        }
        
        if titleCell == filterListData.selectedItem, titleCell != selectedValue {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            return false
        }
        
        if titleCell != filterListData.selectedItem, titleCell == selectedValue {
            return true
        }
        
        return false
    }
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}

extension PerspectiveFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedValue == filterListData.filterList[indexPath.row] {
            selectedValue = ""
            selectedFilter("")
        } else {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            selectedValue = filterListData.filterList[indexPath.row]
            selectedFilter(selectedValue)
        }
        tableView.reloadData()
    }
}
