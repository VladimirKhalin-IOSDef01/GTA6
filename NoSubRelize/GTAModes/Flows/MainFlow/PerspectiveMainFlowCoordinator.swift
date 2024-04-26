
import Foundation
import UIKit

final class PerspectiveMainFlowCoordinator: NSObject, PerspectiveFlowCoordinator {
    
    private weak var rootViewController: UIViewController?
    private weak var panPresentedViewController: UIViewController?
    private weak var presentedViewController: UIViewController?
    
    
    override init() {
        super.init()
    }
    
    
    //MARK: Start View Controlle
    
    func perspectiveCreateFlow() -> UIViewController {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let model = PerspectiveMainModel(navigationHandler: self as MainModel_NavigationHandler)
        let controller = PerspectiveMainViewControllerNew(model: model)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController = controller
        
        return controller
    }
}

extension PerspectiveMainFlowCoordinator: MainModel_NavigationHandler {
    
    func perspectiveMainModel_DidRequestToModes(_ model: PerspectiveMainModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let modelScreen = PerspectiveMainModel(navigationHandler: self as MainModel_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let model = PerspectiveGameModesModel(navigationHandler: self as PerspectiveModesModelNavHandler)
        let controller = PerspectiveModesViewController(model: model, modelScreen: modelScreen)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToModesInfo(_ model: PerspectiveMainModel) {
        let model = PerspectiveGameModesModel(navigationHandler: self as PerspectiveModesModelNavHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = PerspectiveModesInfoViewController(model: model)
        presentedViewController = controller
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToMap(_ model: PerspectiveMainModel) {
        let controller = PerspectiveGameMapViewController(navigationHandler: self as PerspectiveMap_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToGameSelection(_ model: PerspectiveMainModel) {
        let model = PerspectiveGSModel(navigationHandler: self as GS_Model_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = PerspectiveGSViewController(model: model)
        presentedViewController = controller
        
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToChecklist(_ model: PerspectiveMainModel) {
        let model = PerspectiveChecklistModel(navigationHandler: self as ChecklistModel_NavigationHandler)
        let controller = PerspectiveChecklistViewController(model: model)
        presentedViewController = controller
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension PerspectiveMainFlowCoordinator: GS_Model_NavigationHandler {

    func perspectiveGsModel_DidRequestToBack(_ model: PerspectiveGSModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func perspectiveGsModel_DidRequestToGameModes(_ model: PerspectiveGSModel, gameVersion: String) {
        let model = PerspectiveGameCheatsModel(versionGame: gameVersion, navigationHandler: self as Cheats_ModelNavigationHandler)
        let controller = PerspectiveGameCheatsViewController(model: model)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.pushViewController(controller, animated: true)
    }

}

extension PerspectiveMainFlowCoordinator: ChecklistModel_NavigationHandler {
    
    func perspectiveChecklist_Model_DidRequestToFilter(
        _ model: PerspectiveChecklistModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = PerspectiveFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as Filter_NavigationHandler
        )
        presentedViewController?.perspectivePresentPanCollection(controller)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        panPresentedViewController = controller
    }
    
    
    func perspectiveChecklistModel_DidRequestToBack(_ model: PerspectiveChecklistModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}

extension PerspectiveMainFlowCoordinator: Cheats_ModelNavigationHandler {
    
    func perspectiveGameModesModel_DidRequestToBack(_ model: PerspectiveGameCheatsModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func perspectiveGameModesModel_DidRequestToFilter(
        _ model: PerspectiveGameCheatsModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
        
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = PerspectiveFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as Filter_NavigationHandler
        )
        presentedViewController?.perspectivePresentPanCollection(controller)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        panPresentedViewController = controller
    }
    
}

extension PerspectiveMainFlowCoordinator: Filter_NavigationHandler {
    
    func filterDidRequestToClose() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        panPresentedViewController?.dismiss(animated: true)
    }
    
}

extension PerspectiveMainFlowCoordinator: PerspectiveMap_NavigationHandler {
    
    func mapDidRequestToBack() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
}

extension PerspectiveMainFlowCoordinator: PerspectiveModesModelNavHandler {
    
    func perspectiveGameModesModel_DidRequestToFilter(_ model: PerspectiveGameModesModel, filterListData: GTAVK_FilterList_Data, selectedFilter: @escaping (String) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = PerspectiveFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as Filter_NavigationHandler
        )
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.perspectivePresentPanCollection(controller)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        panPresentedViewController = controller
    }
    
    func perspectiveGameModesModel_DidRequestToBack(_ model: PerspectiveGameModesModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}
