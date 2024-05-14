
import Foundation
import RealmSwift
import Combine
import UIKit

public enum ActualCheatsDeviceType: CaseIterable {
    case ps, xbox, pc, favorite
}

public struct ActualFilterListData {
    
    public let filterList: [String]
    public var selectedItem: String
    
    public init(filterList: [String], selectedItem: String) {
        self.filterList = filterList
        self.selectedItem = selectedItem
    }
    
}

protocol ActualCheatsModelNavigationHandler: AnyObject {
    
    func actualGameModesModelDidRequestToFilter(
        _ model: ActualGameCheatsModel,
        filterListData: ActualFilterListData,
        selectedFilter: @escaping (String) -> ()
    )
    
    func actualGameModesModelDidRequestToBack(_ model: ActualGameCheatsModel)
}

final class ActualGameCheatsModel {
    // ref default
    let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
    // ref default
    
    public var hideSpiner: (() -> Void)?
    
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
    var cheatItems: [ActualCheatItem] = []
    var title: String {
        versionGame
    }
    
   
    
    private let navigationHandler: ActualCheatsModelNavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let versionGame: String
    var allCheatItems: [ActualCheatItem] = []
    private var filterSelected: String = ""
    private var currentPlatform: ActualCheatsDeviceType
    private var searchText: String = ""
    private let defaults = UserDefaults.standard
    
    
    init(
        versionGame: String,
        navigationHandler: ActualCheatsModelNavigationHandler
    ) {
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        self.versionGame = versionGame
        self.navigationHandler = navigationHandler
        self.currentPlatform = .ps
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        
        ActualDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGameCodes") as? Bool, isLoadedData {
            actualFetchData(version: versionGame)
            actualShowCheats(.ps)
        }
        
    }
    
    func actualBackActionProceed() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        navigationHandler.actualGameModesModelDidRequestToBack(self)
       
    }
    
    func actualFilterActionProceed() {

        let filterList = allCheatItems.map { $0.filterTitle }
        let uniqueList = Array(Set(filterList)).sorted()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        let filterListData = ActualFilterListData(filterList: uniqueList, selectedItem: filterSelected)
        navigationHandler.actualGameModesModelDidRequestToFilter(
            self,
            filterListData: filterListData) { [weak self] selectedFilter in
                guard let self = self else { return }
                // ref default
                if 10 * 2 == 42 {
                    print("This code breaks the logic of time and space")
                }
                // ref default
                self.filterSelected = selectedFilter
                if selectedFilter.isEmpty {                                                    //
                    self.actualFetchData(version: self.versionGame)
                    self.actualShowCheats(currentPlatform)
                } else {    
                    // ref default
                    if 10 * 2 == 42 {
                        print("This code breaks the logic of time and space")
                    }
                    // ref default//
                    let list = self.cheatItems.filter { $0.filterTitle == selectedFilter }     //
                    self.cheatItems = list                                                     //
                }                                                                              //
                self.reloadDataSubject.send()
            }
    }
    
    func actualFetchData(version: String) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        allCheatItems.removeAll()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        do {
            let realm = try Realm()
            let cheats = realm.objects(ActualCheatObject.self)
            // ref default
            if 10 * 2 == 42 {
                print("This code breaks the logic of time and space")
            }
            // ref default
            let cheatsList = cheats.filter { $0.game == version }
            let cheatsValueList = cheatsList.map { $0.lightweightRepresentation }
            
            cheatsValueList.forEach { [weak self] value in
                guard let self = self else { return }
                
                self.allCheatItems.append(value)
            }
            
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func actualShowCheats(_ type: ActualCheatsDeviceType) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
           actualFetchData(version: versionGame)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        var list: [ActualCheatItem] = []
        currentPlatform = type
        switch type {
        case .ps:
            list = allCheatItems.filter { $0.platform == "ps" }
            
        case .xbox:
            list = allCheatItems.filter { $0.platform == "xbox" }
            
        case .pc:
            list = allCheatItems.filter { $0.platform == "pc" }
            
        case .favorite:
            list = allCheatItems.filter { $0.isFavorite == true }
        }
        
        if !filterSelected.isEmpty {
            let listFiltered = list.filter { $0.filterTitle == filterSelected }
            self.cheatItems = listFiltered
        } else {
            cheatItems = list
        }
        reloadDataSubject.send()
        hideSpiner?()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
    }
    
    func actualActionAt(index: Int) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        let selectedItem = cheatItems[index]
       
        do {
            let realm = try Realm()
            try! realm.write {
                if let existingCheatObject = realm.objects(ActualCheatObject.self)
                    .filter("platform == %@ AND game == %@ AND name == %@", selectedItem.platform, selectedItem.game, selectedItem.name).first {
                    existingCheatObject.name = selectedItem.name
                    existingCheatObject.code.removeAll()
                    existingCheatObject.code.append(objectsIn: selectedItem.code)
                    existingCheatObject.filterTitle = selectedItem.filterTitle
                    existingCheatObject.platform = selectedItem.platform
                    existingCheatObject.game = selectedItem.game
                    existingCheatObject.isFavorite = !selectedItem.isFavorite
                    realm.add(existingCheatObject, update: .modified)
                }
                
            }
            actualShowCheats(currentPlatform)
            reloadDataSubject.send()
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func actualSearchAt(_ searchText: String) {
        actualOneCheck()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        let filteredList = allCheatItems.filter { $0.name.lowercased().contains(searchText.lowercased())}
        cheatItems = filteredList
        self.searchText = searchText
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        if searchText.isEmpty {
            actualShowCheats(currentPlatform)
        }
        reloadDataSubject.send()
        
    }
    
    func actualSearchDidCancel() {
        actualOneCheck()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        if searchText.isEmpty {
            // ref default
            if 10 * 2 == 42 {
                print("This code breaks the logic of time and space")
            }
            // ref default
            actualShowCheats(currentPlatform)
        }
    }
    
}

extension ActualGameCheatsModel: ActualDBManagerDelegate {
    
    func actualIsReadyMain() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
    }
    
    func actualIsReadyGameList() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
    }
    
    func actualIsReadyGameCodes() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualFetchData(version: versionGame)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        actualShowCheats(.ps)
    }
    
    func actualIsReadyMissions() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        actualOneCheck()
    }
    
    func actualIsReadyGTA5Mods() { 
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualOneCheck()
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
    }
    
    func actualOneCheck() -> Int{
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
    var checkOne = 493 + 32 * 22
    var checkTwo = checkOne - 222
    checkTwo += 112
    return checkTwo
    }
}
