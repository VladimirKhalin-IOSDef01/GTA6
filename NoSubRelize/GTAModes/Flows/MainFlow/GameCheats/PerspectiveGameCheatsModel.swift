
import Foundation
import RealmSwift
import Combine
import UIKit

public enum Cheats_Device_Type: CaseIterable {
    case ps, xbox, pc, favorite
}

public struct GTAVK_FilterList_Data {
    
    public let filterList: [String]
    public let selectedItem: String
    
    init(filterList: [String], selectedItem: String) {
        self.filterList = filterList
        self.selectedItem = selectedItem
    }
    
}

protocol Cheats_ModelNavigationHandler: AnyObject {
    
    func perspectiveGameModesModel_DidRequestToFilter(
        _ model: PerspectiveGameCheatsModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
    )
    
    func perspectiveGameModesModel_DidRequestToBack(_ model: PerspectiveGameCheatsModel)
}

final class PerspectiveGameCheatsModel {
    
    public var hideSpiner: (() -> Void)?
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var cheatItems: [PerspectiveCheat_Item] = []
    var title: String {
        versionGame
    }
    private let navigationHandler: Cheats_ModelNavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let versionGame: String
    var allCheatItems: [PerspectiveCheat_Item] = []
    private var filterSelected: String = ""
    private var currentPlatform: Cheats_Device_Type
    private var searchText: String = ""
    private let defaults = UserDefaults.standard
    
    
    init(
        versionGame: String,
        navigationHandler: Cheats_ModelNavigationHandler
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        self.versionGame = versionGame
        self.navigationHandler = navigationHandler
        self.currentPlatform = .ps
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
        PerspectiveDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGameCodes") as? Bool, isLoadedData {
            perspectiveFetchData(version: versionGame)
            perspectiveShowCheats(.ps)
        }
        
    }
    
    func perspectiveBackAction_Proceed() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        navigationHandler.perspectiveGameModesModel_DidRequestToBack(self)
       
    }
    
    func perspectiveFilterAction_Proceed() {

        let filterList = allCheatItems.map { $0.filterTitle }
        let uniqueList = Array(Set(filterList)).sorted()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let filterListData = GTAVK_FilterList_Data(filterList: uniqueList, selectedItem: filterSelected)
        navigationHandler.perspectiveGameModesModel_DidRequestToFilter(
            self,
            filterListData: filterListData) { [weak self] selectedFilter in
                guard let self = self else { return }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                self.filterSelected = selectedFilter
                if selectedFilter.isEmpty {                                                    //
                    self.perspectiveFetchData(version: self.versionGame)
                    self.perspectiveShowCheats(currentPlatform)
                } else {                                                                       //
                    let list = self.cheatItems.filter { $0.filterTitle == selectedFilter }     //
                    self.cheatItems = list                                                     //
                }                                                                              //
                self.reloadDataSubject.send()
            }
    }
    
    func perspectiveFetchData(version: String) {
        allCheatItems.removeAll()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        do {
            let realm = try Realm()
            let cheats = realm.objects(PerspectiveCheat_Object.self)
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
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
    
    func perspectiveShowCheats(_ type: Cheats_Device_Type) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
           perspectiveFetchData(version: versionGame)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        var list: [PerspectiveCheat_Item] = []
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
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspectiveActionAt(index: Int) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let selectedItem = cheatItems[index]
        do {
            let realm = try Realm()
            try! realm.write {
                if let existingCheatObject = realm.objects(PerspectiveCheat_Object.self)
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
            perspectiveShowCheats(currentPlatform)
            reloadDataSubject.send()
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func perspectiveSearchAt(_ searchText: String) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let filteredList = allCheatItems.filter { $0.name.lowercased().contains(searchText.lowercased())}
        cheatItems = filteredList
        self.searchText = searchText
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if searchText.isEmpty {
            perspectiveShowCheats(currentPlatform)
        }
        reloadDataSubject.send()
        
    }
    
    func perspectiveSearchDidCancel() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if searchText.isEmpty {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            perspectiveShowCheats(currentPlatform)
        }
    }
    
}

extension PerspectiveGameCheatsModel: PerspectiveDBManagerDelegate {
    
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
    }
    
    func perspective_isReady_GameCodes() {
        perspectiveFetchData(version: versionGame)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveShowCheats(.ps)
    }
    
    func perspective_isReady_Missions() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
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
