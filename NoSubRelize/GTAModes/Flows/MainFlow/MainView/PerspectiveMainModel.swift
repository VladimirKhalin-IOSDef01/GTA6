
import Foundation
import RealmSwift
import Combine

protocol MainModel_NavigationHandler: AnyObject {
    
    func perspectiveMainModel_DidRequestToGameSelection(_ model: PerspectiveMainModel)
    func perspectiveMainModel_DidRequestToChecklist(_ model: PerspectiveMainModel)
    func perspectiveMainModel_DidRequestToMap(_ model: PerspectiveMainModel)
    func perspectiveMainModel_DidRequestToModes(_ model: PerspectiveMainModel)
    func perspectiveMainModel_DidRequestToModesInfo(_ model: PerspectiveMainModel)
}

final class PerspectiveMainModel {
    
    public var hideSpiner: (() -> Void)?
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var menuItems: [PerspectiveMain_Item] = []
    
    private let navigationHandler: MainModel_NavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let defaults = UserDefaults.standard
    var notificationToken: NotificationToken?
    
    init(
        navigationHandler: MainModel_NavigationHandler
    ) {
        self.navigationHandler = navigationHandler
        
        PerspectiveDBManager.shared.delegate = self
        PerspectiveDBManager.shared.perspectiveSetupDropBox()
    }
    
    public func perspectiveSelectedItems(index: Int) {
        if index == 0 {
            navigationHandler.perspectiveMainModel_DidRequestToGameSelection(self)
        }
        
        if index == 1 {
            navigationHandler.perspectiveMainModel_DidRequestToChecklist(self)
        }
        
        if index == 2 {
            navigationHandler.perspectiveMainModel_DidRequestToMap(self)
        }
        
        if index == 3 {
            navigationHandler.perspectiveMainModel_DidRequestToModes(self)
        }
       
        if index == 4 {
            navigationHandler.perspectiveMainModel_DidRequestToModesInfo(self)
        }
    }

    func perspectiveFetchData() {
        if menuItems.count != 5 {
            do {
                let realm = try Realm()
                let menuItem = realm.objects(PerspectiveMainItemObject.self)
                let valueList = menuItem.filter { $0.rawTypeItem == "main"}
                let trueValueList = valueList.map { $0.lightweightRepresentation }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                trueValueList.forEach { [weak self] value in
                    guard let self = self else { return }
                    
                    self.menuItems.append(value)
                }
                reloadDataSubject.send()
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                hideSpiner?()
            } catch {
                print("Error saving data to Realm: \(error)")
            }
        }
    }
    
}

extension PerspectiveMainModel: PerspectiveDBManagerDelegate {
    
    func perspective_isReady_Main() {
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveFetchData()
    }
    
    func perspective_isReady_GameList() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
    }
    
    func perspective_isReady_GameCodes() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}
