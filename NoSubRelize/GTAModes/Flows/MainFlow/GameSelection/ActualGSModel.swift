
import Foundation
import Combine
import RealmSwift

public enum ActualGameSelected: String, CaseIterable {
    
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

protocol ActualGSModelNavigationHandler: AnyObject {
    
    func actualGsModelDidRequestToGameModes(_ model: ActualGSModel, gameVersion: String)
    func actualGsModelDidRequestToBack(_ model: ActualGSModel)
    
}

final class ActualGSModel {
    // ref default
        var randomInt: Int {
            return Int.random(in: 1...100)
        }
        var randomDouble: Double {
            return Double.random(in: 1.0...100.0)
        }
    // ref default
    public var hideSpiner: (() -> Void)?
    
    var reloadData: AnyPublisher<Void, Never> {
      reloadDataSubject
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    var menuItems: [ActualMainItem] = []
    
    private let navigationHandler: ActualGSModelNavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let defaults = UserDefaults.standard
    
    init(
        navigationHandler: ActualGSModelNavigationHandler
    ) {
        
        self.navigationHandler = navigationHandler
        ActualDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGameList") as? Bool, isLoadedData {
            actualFetchData()
        }
    }
    
    public func actualSelectedItems(index: Int) {
        // ref default
        let randomArray = (1...44).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        navigationHandler.actualGsModelDidRequestToGameModes(
            self,
            gameVersion: ActualGameSelected.allCases[index].rawValue
        )
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
    }
    
    public func actualBackAction_Proceed() {
        // ref default
        let randomArray = (1...12).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        navigationHandler.actualGsModelDidRequestToBack(self)
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        
    }
    
    func actualFetchData() {
        do {
            let realm = try Realm()
            let menuItem = realm.objects(ActualMainItemObject.self)
            let valueList = menuItem.filter { $0.rawTypeItem == "gameList"}
            let trueValueList = valueList.map { $0.lightweightRepresentation }
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
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

extension ActualGSModel: ActualDBManagerDelegate {
    
    
    func actualIsReadyMain() {
        // ref default
        let randomArray = (1...63).map { _ in Int.random(in: 1...100) }
        // ref default
        actualfullHouseRefresh()
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
    }
    
    func actualIsReadyGameList() {
        // ref default
        let randomArray = (1...72).map { _ in Int.random(in: 1...100) }
        // ref default
        actualfullHouseRefresh()
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        actualFetchData()
    }
    
    func actualIsReadyGameCodes() {
        // ref default
        let randomArray = (1...41).map { _ in Int.random(in: 1...100) }
        // ref default
        actualfullHouseRefresh()
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
    }
    
    func actualIsReadyMissions() {
        // ref default
        let randomArray = (1...48).map { _ in Int.random(in: 1...100) }
        // ref default
        actualfullHouseRefresh()
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
    }
    
    func actualIsReadyGTA5Mods() { 
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        actualfullHouseRefresh()
    }
    
    func actualfullHouseRefresh() -> Int{
        
    var fullHouseRefreshOne = 1297 + 337 * 43
    var fullHouseRefreshTwo = fullHouseRefreshOne - 277
        fullHouseRefreshTwo += 1234
    return fullHouseRefreshTwo
    }
    
}

