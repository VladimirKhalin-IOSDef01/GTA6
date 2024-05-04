
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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        self.navigationHandler = navigationHandler
        
        
        ActualDBManager.shared.delegate = self
        ActualDBManager.shared.perspectiveSetupDropBox()
    }
    
    public func actualSelectedItems(index: Int) {
        if index == 0 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            navigationHandler.actualMainModelDidRequestToGameSelection(self)
        }
        
        if index == 1 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            navigationHandler.actualMainModelDidRequestToChecklist(self)
        }
        
        if index == 2 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            navigationHandler.actualMainModelDidRequestToMap(self)
        }
        
        if index == 3 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            navigationHandler.actualMainModelDidRequestToModes(self)
        }
       
        if index == 4 {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
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
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                trueValueList.forEach { [weak self] value in
                    guard let self = self else { return }
                    
                    self.menuItems.append(value)
                }
                reloadDataSubject.send()
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
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
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualFetchData()
    }
    
    func actualIsReadyGameList() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
    }
    
    func actualIsReadyGameCodes() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    func actualIsReadyMissions() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    func actualIsReadyGTA5Mods() { 
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    func actualOneCheck() -> Int{
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}
