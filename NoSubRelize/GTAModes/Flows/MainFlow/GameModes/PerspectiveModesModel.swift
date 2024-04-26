
import Foundation
import RealmSwift
import Combine
import UIKit

protocol PerspectiveModesModelNavHandler: AnyObject {
    
    func perspectiveGameModesModel_DidRequestToFilter(
        _ model: PerspectiveGameModesModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
    )
    func perspectiveGameModesModel_DidRequestToBack(_ model: PerspectiveGameModesModel)
    
}

final class PerspectiveGameModesModel {
    
    public var hideSpiner: (() -> Void)?
    
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var showSpinnerData: AnyPublisher<Bool, Never> {
        showSpinnerSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var showDocumentSaverData: AnyPublisher<String, Never> {
        showDocumentSaverSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var showAlertSaverData: AnyPublisher<String, Never> {
        showAlertSaverSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    var modeItems: [PerspectiveModItem] = []
    var title: String {
        "Mods Version 5"
    }
    private let navigationHandler: PerspectiveModesModelNavHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private let showDocumentSaverSubject = PassthroughSubject<String, Never>()
    private let showAlertSaverSubject = PassthroughSubject<String, Never>()
    private let showSpinnerSubject = PassthroughSubject<Bool, Never>()
    var allModeItems: [PerspectiveModItem] = []
    private var filterSelected: String = ""
    private var searchText: String = ""
    private let defaults = UserDefaults.standard
    
    
    init(
        navigationHandler: PerspectiveModesModelNavHandler
    ) {
        self.navigationHandler = navigationHandler
        
        PerspectiveDBManager.shared.delegate = self
        
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGTA5Mods") as? Bool, isLoadedData {
            perspectiveFetchData()
            perspectiveShowMods()
        }
    }
    
    func perspectiveBackActionProceed() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        navigationHandler.perspectiveGameModesModel_DidRequestToBack(self)
    }
    
    func perspectiveFilterActionProceed() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let filterList = allModeItems.map { $0.filterTitle }
        let uniqueList = Array(Set(filterList)).sorted()
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
                if selectedFilter.isEmpty {
                    self.modeItems = allModeItems
                } else {
                    let list = self.allModeItems.filter { $0.filterTitle == selectedFilter }
                    self.modeItems = list
                }
                self.reloadDataSubject.send()
            }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspectiveFetchData() {
        allModeItems.removeAll()
        do {
            let realm = try Realm()
            let modes = realm.objects(PerspectiveModObject.self)
            let modesList = modes.map { $0.lightweightRepresentation }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            modesList.forEach { [weak self] value in
                guard let self = self else { return }
                
                self.allModeItems.append(value)
            }
        } catch {
            print("Error saving data to Realm: \(error)")
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
        }
    }
    
    func perspectiveDownloadMode(index: Int) {
        let mode = modeItems[index]
//
        if !perspectiveCheckIsLoadData(mode.modPath) {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            showSpinnerSubject.send(true)
          //  showSpinnerSubject.send(false)
            
            PerspectiveDBManager.shared.perspectiveDownloadMode(mode: mode) { [weak self] localUrl in
                if let localUrl = localUrl {
                    print("File downloaded to: \(localUrl)")
                    self?.showSpinnerSubject.send(false)
                    self?.showDocumentSaverSubject.send(localUrl)
                    self?.reloadDataSubject.send()
                } else {
                    self?.showSpinnerSubject.send(false)
                    self?.reloadDataSubject.send()
                    self?.showAlertSaverSubject.send("Some problem with file")
                }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
            }
        } else {
//            showSpinnerSubject.send(false)
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            showDocumentSaverSubject.send(mode.modPath)
            
            reloadDataSubject.send()
            print("FILE IS LOCALY")
        }
        
    }
    
    func perspectiveCheckIsLoadData(_ modeName: String) -> Bool {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(modeName)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return FileManager.default.fileExists(atPath: fileURL.path)
    }
    
    func perspectiveCheckIsDownloading(_ namName: String) -> Bool {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return true
    }

    func perspectiveShowMods() {
        modeItems = allModeItems
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        reloadDataSubject.send()
        hideSpiner?()
    }
    
    func perspectiveSearchAt(_ searchText: String) {
        let filteredList = allModeItems.filter { $0.title.lowercased().contains(searchText.lowercased())}
        modeItems = filteredList
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        self.searchText = searchText
        if searchText.isEmpty {
            modeItems = allModeItems
        }
        reloadDataSubject.send()
    }
    
    func perspectiveSearchDidCancel() {
        if searchText.isEmpty {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            modeItems = allModeItems
        }
    }
    
}

extension PerspectiveGameModesModel: PerspectiveDBManagerDelegate {
    
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
        perspectiveFetchData()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveShowMods()
    }
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
}
