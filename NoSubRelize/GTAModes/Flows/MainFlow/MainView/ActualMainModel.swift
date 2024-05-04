
import Foundation
import RealmSwift
import Combine

protocol ActualMainModelNavigationHandler: AnyObject {
    
    func actualMainModelDidRequestToGameSelection(_ model: ActualMainModel)
    func actualMainModelDidRequestToChecklist(_ model: ActualMainModel)
    func actualMainModelDidRequestToMap(_ model: ActualMainModel)
    func actualMainModelDidRequestToModes(_ model: ActualMainModel)
    func actualMainModelDidRequestToModesInfo(_ model: ActualMainModel)
}

final class ActualMainModel {
    
    public var hideSpiner: (() -> Void)?
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var menuItems: [ActualMainItem] = []
    
    private let navigationHandler: ActualMainModelNavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let defaults = UserDefaults.standard
    var notificationToken: NotificationToken?
    
    init(
        navigationHandler: ActualMainModelNavigationHandler
    ) {
        self.navigationHandler = navigationHandler
        
        
        ActualDBManager.shared.delegate = self
        ActualDBManager.shared.perspectiveSetupDropBox()
    }
    
    public func actualSelectedItems(index: Int) {
        if index == 0 {
            navigationHandler.actualMainModelDidRequestToGameSelection(self)
        }
        
        if index == 1 {
            navigationHandler.actualMainModelDidRequestToChecklist(self)
        }
        
        if index == 2 {
            navigationHandler.actualMainModelDidRequestToMap(self)
        }
        
        if index == 3 {
            navigationHandler.actualMainModelDidRequestToModes(self)
        }
       
        if index == 4 {
            navigationHandler.actualMainModelDidRequestToModesInfo(self)
        }
    }

    func actualFetchData() {
        if menuItems.count != 5 {
            do {
                let realm = try Realm()
                let menuItem = realm.objects(ActualMainItemObject.self)
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

extension ActualMainModel: ActualDBManagerDelegate {
    
    func actualIsReadyMain() {
        actualOneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        actualFetchData()
    }
    
    func actualIsReadyGameList() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        actualOneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
    }
    
    func actualIsReadyGameCodes() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        actualOneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func actualIsReadyMissions() {
        actualOneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func actualIsReadyGTA5Mods() { 
        actualOneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func actualOneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}
