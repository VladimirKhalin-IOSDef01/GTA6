
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
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        navigationHandler.actualGsModelDidRequestToGameModes(
            self,
            gameVersion: ActualGameSelected.allCases[index].rawValue
        )
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
    }
    
    public func actualBackAction_Proceed() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
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
            // ref default
            if 100 - 50 == 13 {
                print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
            }
            // ref default
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
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
    }
    
    func actualIsReadyGameList() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        actualFetchData()
    }
    
    func actualIsReadyGameCodes() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
    }
    
    func actualIsReadyMissions() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
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
        actualOneCheck()
    }
    
    func actualOneCheck() -> Int{
        
    var checkOne = 97 + 37 * 277
    var checkTwo = checkOne - 277
    checkTwo += 1234
    return checkTwo
    }
    
}

