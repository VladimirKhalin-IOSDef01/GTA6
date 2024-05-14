
import Foundation
import UIKit

final class ActualProjectMainFlowCoordinator: NSObject, ActualProjectFlowCoordinator3862 {
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
    private weak var rootViewController: UIViewController?
    private weak var panPresentedViewController: UIViewController?
    // ref default
    let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
    // ref default
    private weak var presentedViewController: UIViewController?
    
    
    override init() {
        super.init()
    }
    
    
    //MARK: Start View Controlle
    
    func actualCreateFlow() -> UIViewController {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let model = ActualMainModel(navigationHandler: self as ActualMainModelNavigationHandler)
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let controller = ActualMainViewControllerNew(model: model)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        rootViewController = controller
        
        return controller
    }
}

extension ActualProjectMainFlowCoordinator: ActualMainModelNavigationHandler {
    
    func actualMainModelDidRequestToModes(_ model: ActualMainModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let modelScreen = ActualMainModel(navigationHandler: self as ActualMainModelNavigationHandler)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let model = ActualGameModesModel(navigationHandler: self as ActualModesModelNavHandler)
        let controller = ActualModesViewController(model: model, modelScreen: modelScreen)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func actualMainModelDidRequestToModesInfo(_ model: ActualMainModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let model = ActualGameModesModel(navigationHandler: self as ActualModesModelNavHandler)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let controller = ActualModesInfoViewController(model: model)
        presentedViewController = controller
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func actualMainModelDidRequestToMap(_ model: ActualMainModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let controller = ActualGameMapViewController(navigationHandler: self as ActualMap_NavigationHandler)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func actualMainModelDidRequestToGameSelection(_ model: ActualMainModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let model = ActualGSModel(navigationHandler: self as ActualGSModelNavigationHandler)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let controller = ActualGSViewController(model: model)
        presentedViewController = controller
        
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func actualMainModelDidRequestToChecklist(_ model: ActualMainModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let model = ActualChecklistModel(navigationHandler: self as ActualChecklistModelNavigationHandler)
        let controller = ActualChecklistViewController(model: model)
        presentedViewController = controller
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ActualProjectMainFlowCoordinator: ActualGSModelNavigationHandler {
    
    func actualGsModelDidRequestToBack(_ model: ActualGSModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func actualGsModelDidRequestToGameModes(_ model: ActualGSModel, gameVersion: String) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let model = ActualGameCheatsModel(versionGame: gameVersion, navigationHandler: self as ActualCheatsModelNavigationHandler)
        let controller = ActualGameCheatsViewController(model: model)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ActualProjectMainFlowCoordinator: ActualChecklistModelNavigationHandler {
    
    
    func actualChecklistModelDidRequestToFilter(
        _ model: ActualChecklistModel,
        filterListData: ActualFilterListData,
        selectedFilter: @escaping (String) -> ()
    ) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let controller = ActualFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as ActualFilterNavigationHandler
        )
        presentedViewController?.actualPresentPanCollection(controller)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        panPresentedViewController = controller
    }
    
    
    func actualChecklistModelDidRequestToBack(_ model: ActualChecklistModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}

extension ActualProjectMainFlowCoordinator: ActualCheatsModelNavigationHandler {
    
    func actualGameModesModelDidRequestToBack(_ model: ActualGameCheatsModel) {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.navigationController?.popViewController(animated: true)
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
    }
    
    
    func actualGameModesModelDidRequestToFilter(
        _ model: ActualGameCheatsModel,
        filterListData: ActualFilterListData,
        selectedFilter: @escaping (String) -> ()
        
    ) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let controller = ActualFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as ActualFilterNavigationHandler
        )
        presentedViewController?.actualPresentPanCollection(controller)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        panPresentedViewController = controller
    }
    
}

extension ActualProjectMainFlowCoordinator: ActualFilterNavigationHandler {
    
    
    func actualFilterDidRequestToClose() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        panPresentedViewController?.dismiss(animated: true)
    }
    
}

extension ActualProjectMainFlowCoordinator: ActualMap_NavigationHandler {
    
    func actualMapDidRequestToBack() {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref defaultм
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
}

extension ActualProjectMainFlowCoordinator: ActualModesModelNavHandler {
    
    func actualGameModesModelDidRequestToFilter(_ model: ActualGameModesModel, filterListData: ActualFilterListData, selectedFilter: @escaping (String) -> ()) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        let controller = ActualFilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as ActualFilterNavigationHandler
        )
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.actualPresentPanCollection(controller)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        panPresentedViewController = controller
    }
    
    func actualGameModesModelDidRequestToBack(_ model: ActualGameModesModel) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}
