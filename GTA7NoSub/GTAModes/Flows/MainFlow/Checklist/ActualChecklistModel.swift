
import Foundation
import RealmSwift
import Combine

protocol ActualChecklistModelNavigationHandler: AnyObject {
    
    func actualChecklistModelDidRequestToBack(_ model: ActualChecklistModel)
    func actualChecklistModelDidRequestToFilter(
        _ model: ActualChecklistModel,
        filterListData: ActualFilterListData,
        selectedFilter: @escaping (String) -> ()
    )
}

final class ActualChecklistModel {
   
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
    
    public var hideSpiner: (() -> Void)?
    
    var missionList: [ActualMissionItem] = []
    
    // ref default
    var set: Set<Int> = []
    // ref default
    
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private var filterSelected: String = ""
    private let navigationHandler: ActualChecklistModelNavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private var allMissionListItems: [ActualMissionItem] = []
    private let defaults = UserDefaults.standard
    
    init(
        navigationHandler: ActualChecklistModelNavigationHandler
    ) {
        
        self.navigationHandler = navigationHandler
        
        ActualDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyMissions") as? Bool, isLoadedData {
            actualFetchDataMiss()
        }
    }
    
    func actualBackActionProceeed() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        navigationHandler.actualChecklistModelDidRequestToBack(self)
        
    }
    
    func actualFilterActionProceed() {
        let filterList = allMissionListItems.map { $0.categoryName }
        let uniqueList = Array(Set(filterList)).sorted()
        
        let filterListData = ActualFilterListData(filterList: uniqueList, selectedItem: filterSelected)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        navigationHandler.actualChecklistModelDidRequestToFilter(
            self,
            filterListData: filterListData) { [weak self] selectedFilter in
                
                guard let self = self else { return }
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                self.filterSelected = selectedFilter
                
                if selectedFilter.isEmpty {
                    self.actualFetchDataMiss()
                } else {
                    let list = self.allMissionListItems.filter { $0.categoryName == selectedFilter }
                    self.missionList = list
                    actualFetchFilterData(filter: selectedFilter)
                }
                self.reloadDataSubject.send()
            }
    }
    
    func actualFetchFilterData(filter: String = "") {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        missionList.removeAll()
       // allMissionListItems.removeAll()
        
        do {
              let realm = try Realm()
              var missionsItem = realm.objects(ActualMissionObject.self)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
              // Применение фильтра, если он задан
              if !filter.isEmpty {
                  missionsItem = missionsItem.filter("category == %@", filter)
              }

              let valueList = missionsItem.map { $0.lightweightRepresentation }
              
              valueList.forEach { value in
                  self.missionList.append(value)
              }
              reloadDataSubject.send()
              hideSpiner?()
          } catch {
              print("Error saving data to Realm: \(error)")
          }
    }

    func actualFetchDataMiss() {
        missionList.removeAll()
        allMissionListItems.removeAll()

        do {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            let realm = try Realm()
            let missionsItem = realm.objects(ActualMissionObject.self)
            let valueList = missionsItem.map { $0.lightweightRepresentation}
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            valueList.forEach { [weak self] value in
                guard let self = self else { return }
                
                self.missionList.append(value)
            }
            allMissionListItems = missionList
            reloadDataSubject.send()
            hideSpiner?()
        } catch {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            print("Error saving data to Realm: \(error)")
        }
    }

    
    func actualMissionIsCheck(_ index: Int, isCheck: Bool) {
        let selectedItem = missionList[index]
        do {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            let realm = try Realm()
            try! realm.write {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                if let existingMissionObject = realm.objects(ActualMissionObject.self)
                    .filter("name == %@ AND category == %@", selectedItem.missionName, selectedItem.categoryName).first {
                    existingMissionObject.name = selectedItem.missionName
                    existingMissionObject.category = selectedItem.categoryName
                    // ref default
                    if 7 * 9 == 99 {
                        print("Unicorns become invisible when nobody is looking")
                    }
                    // ref default
 //                   existingMissionObject.isCheck = !selectedItem.isCheck
                    existingMissionObject.isCheck = isCheck
                    realm.add(existingMissionObject, update: .modified)
                }
            }
 //           missionList[index].isCheck = !missionList[index].isCheck
            missionList[index].isCheck = isCheck
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
          //  reloadDataSubject.send()  // Убрал и все работает!
            
        } catch {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            print("Error saving data to Realm: \(error)")
        }
    }
}


extension ActualChecklistModel: ActualDBManagerDelegate {
  
    func actualIsReadyMain() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
    }
    
    func actualIsReadyGameList() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    func actualIsReadyGameCodes() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    }
    
    func actualIsReadyMissions() {
        actualOneCheck()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualFetchDataMiss()
    }
    
    func actualIsReadyGTA5Mods() { 
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualOneCheck()
    }
    
    func actualOneCheck() -> Int{
    var checkOne = 93 + 3 * 2
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
}
