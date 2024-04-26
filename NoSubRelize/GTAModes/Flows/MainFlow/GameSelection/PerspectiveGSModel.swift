
import Foundation
import Combine
import RealmSwift

public enum PerspectiveGame_Selected: String, CaseIterable {
    
    case gta6 = "GTA6"
    case gta5 = "GTA5"
    case gtaVC = "GTAVC"
    case gtaSA = "GTASA"
    
  // MARK: Select Title Name
//    private enum CodingKeys : String, CodingKey {
//          case gta6 = "Version 6"
//          case gta5 = "Version 5"
//          case gtaVC = "Version VC"
//          case gtaSA = "Version SA"
//    }
    
}

protocol GS_Model_NavigationHandler: AnyObject {
    
    func perspectiveGsModel_DidRequestToGameModes(_ model: PerspectiveGSModel, gameVersion: String)
    func perspectiveGsModel_DidRequestToBack(_ model: PerspectiveGSModel)
    
}

final class PerspectiveGSModel {
    
    public var hideSpiner: (() -> Void)?
    
    var reloadData: AnyPublisher<Void, Never> {
      reloadDataSubject
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    var menuItems: [PerspectiveMain_Item] = []
    
    private let navigationHandler: GS_Model_NavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let defaults = UserDefaults.standard
    
    init(
        navigationHandler: GS_Model_NavigationHandler
    ) {
        
        self.navigationHandler = navigationHandler
        PerspectiveDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGameList") as? Bool, isLoadedData {
            perspectiveFetchData()
        }
    }
    
    public func perspectiveSelectedItems(index: Int) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        navigationHandler.perspectiveGsModel_DidRequestToGameModes(
            self,
            gameVersion: PerspectiveGame_Selected.allCases[index].rawValue
        )
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    public func perspectiveBackAction_Proceed() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        navigationHandler.perspectiveGsModel_DidRequestToBack(self)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
    }
    
    func perspectiveFetchData() {
        do {
            let realm = try Realm()
            let menuItem = realm.objects(PerspectiveMainItemObject.self)
            let valueList = menuItem.filter { $0.rawTypeItem == "gameList"}
            let trueValueList = valueList.map { $0.lightweightRepresentation }
            
            trueValueList.forEach { [weak self] value in
                guard let self = self else { return }
                
                self.menuItems.append(value)
            }
            reloadDataSubject.send()
            hideSpiner?()
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
}

extension PerspectiveGSModel: PerspectiveDBManagerDelegate {
    
    
    func perspective_isReady_Main() {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspective_isReady_GameList() {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveFetchData()
    }
    
    func perspective_isReady_GameCodes() {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspective_isReady_Missions() {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspective_isReady_GTA5Mods() { 
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
    }
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
}

