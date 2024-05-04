
import Foundation
import UIKit

final class ActualMainFlowCoordinator: NSObject, ActualFlowCoordinator {
    
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
        let model = ActualMainModel(navigationHandler: self as MainModel_NavigationHandler)
        let controller = ActualMainViewControllerNew(model: model)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController = controller
        
        return controller
    }
}

extension ActualMainFlowCoordinator: MainModel_NavigationHandler {
    
    func perspectiveMainModel_DidRequestToModes(_ model: ActualMainModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let modelScreen = ActualMainModel(navigationHandler: self as MainModel_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let model = ActualGameModesModel(navigationHandler: self as PerspectiveModesModelNavHandler)
        let controller = ActualModesViewController(model: model, modelScreen: modelScreen)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToModesInfo(_ model: ActualMainModel) {
        let model = ActualGameModesModel(navigationHandler: self as PerspectiveModesModelNavHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = ActualModesInfoViewController(model: model)
        presentedViewController = controller
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToMap(_ model: ActualMainModel) {
        let controller = ActualGameMapViewController(navigationHandler: self as PerspectiveMap_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToGameSelection(_ model: ActualMainModel) {
        let model = ActualGSModel(navigationHandler: self as GS_Model_NavigationHandler)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = ActualGSViewController(model: model)
        presentedViewController = controller
        
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func perspectiveMainModel_DidRequestToChecklist(_ model: ActualMainModel) {
        let model = ActualChecklistModel(navigationHandler: self as ChecklistModel_NavigationHandler)
        let controller = ActualChecklistViewController(model: model)
        presentedViewController = controller
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ActualMainFlowCoordinator: GS_Model_NavigationHandler {

    func perspectiveGsModel_DidRequestToBack(_ model: ActualGSModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func perspectiveGsModel_DidRequestToGameModes(_ model: ActualGSModel, gameVersion: String) {
        let model = ActualGameCheatsModel(versionGame: gameVersion, navigationHandler: self as Cheats_ModelNavigationHandler)
        let controller = ActualGameCheatsViewController(model: model)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.pushViewController(controller, animated: true)
    }

}

extension ActualMainFlowCoordinator: ChecklistModel_NavigationHandler {
    
    func perspectiveChecklist_Model_DidRequestToFilter(
        _ model: ActualChecklistModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = ActualFilterViewController(
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
    
    
    func perspectiveChecklistModel_DidRequestToBack(_ model: ActualChecklistModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}

extension ActualMainFlowCoordinator: Cheats_ModelNavigationHandler {
    
    func perspectiveGameModesModel_DidRequestToBack(_ model: ActualGameCheatsModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func perspectiveGameModesModel_DidRequestToFilter(
        _ model: ActualGameCheatsModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
        
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = ActualFilterViewController(
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

extension ActualMainFlowCoordinator: Filter_NavigationHandler {
    
    func filterDidRequestToClose() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        panPresentedViewController?.dismiss(animated: true)
    }
    
}

extension ActualMainFlowCoordinator: PerspectiveMap_NavigationHandler {
    
    func mapDidRequestToBack() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
}

extension ActualMainFlowCoordinator: PerspectiveModesModelNavHandler {
    
    func perspectiveGameModesModel_DidRequestToFilter(_ model: ActualGameModesModel, filterListData: GTAVK_FilterList_Data, selectedFilter: @escaping (String) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = ActualFilterViewController(
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
    
    func perspectiveGameModesModel_DidRequestToBack(_ model: ActualGameModesModel) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}
