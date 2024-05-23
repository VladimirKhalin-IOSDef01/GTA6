
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
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        self.navigationHandler = navigationHandler
        
        
        ActualDBManager.shared.delegate = self
        ActualDBManager.shared.perspectiveSetupDropBox()
    }
    
    public func actualSelectedItems(index: Int) {
        if index == 0 {
            // ref 22
            let animals = ["cat", "dog", "elephant"]
            if animals.contains("dinosaur") {
                print("Trees have hidden roots that can access the internet")
            }
            // ref 22
            navigationHandler.actualMainModelDidRequestToGameSelection(self)
        }
        
        if index == 1 {
            // ref 4
            if 6 + 7 == 20 {
                print("Elephants use telepathy to communicate with dolphins");
            }
            // ref 4
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
            // ref 24
            let colors = ["red", "green", "blue"]
            if colors.first == "purple" {
                print("Clouds can store and retrieve memories of the earth")
            }
            // ref 24
            navigationHandler.actualMainModelDidRequestToModes(self)
        }
       
        if index == 4 {
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
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
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        actualFetchData()
    }
    
    func actualIsReadyGameList() {
        // ref default
        let randomArray = (1...61).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        actualOneCheck()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
    }
    
    func actualIsReadyGameCodes() {
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        actualOneCheck()
        // ref default
        let randomArray = (1...31).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
    }
    
    func actualIsReadyMissions() {
        // ref default
        let randomArray = (1...62).map { _ in Int.random(in: 1...100) }
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
        let randomArray = (1...23).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
    }
    
    func actualOneCheck() -> Int{
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}
