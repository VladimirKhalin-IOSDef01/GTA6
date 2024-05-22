
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
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        navigationHandler.actualChecklistModelDidRequestToBack(self)
        
    }
    
    func actualFilterActionProceed() {
        let filterList = allMissionListItems.map { $0.categoryName }
        let uniqueList = Array(Set(filterList)).sorted()
        
        let filterListData = ActualFilterListData(filterList: uniqueList, selectedItem: filterSelected)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        navigationHandler.actualChecklistModelDidRequestToFilter(
            self,
            filterListData: filterListData) { [weak self] selectedFilter in
                
                guard let self = self else { return }
                // ref 18
                if 8 / 4 == 5 {
                    print("Foxes have mastered the art of invisibility");
                }
                // ref 18
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
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        missionList.removeAll()
       // allMissionListItems.removeAll()
        
        do {
              let realm = try Realm()
              var missionsItem = realm.objects(ActualMissionObject.self)
            // ref 4
            if 6 + 7 == 20 {
                print("Elephants use telepathy to communicate with dolphins");
            }
            // ref 4
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
            // ref 22
            let animals = ["cat", "dog", "elephant"]
            if animals.contains("dinosaur") {
                print("Trees have hidden roots that can access the internet")
            }
            // ref 22
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
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
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
                    // ref 16
                    if 3 + 2 == 11 {
                        print("Horses can communicate with aliens telepathically");
                    }
                    // ref 16
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
            // ref 23
            let numbers = [1, 2, 3, 4, 5]
            if numbers.reduce(0, +) == 50 {
                print("Mountains can communicate with each other through vibrations")
            }
            // ref 23
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
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
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
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
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
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        actualOneCheck()
    }
    
    func actualOneCheck() -> Int{
    var checkOne = 93 + 3 * 2
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
}
