
import Foundation
import RealmSwift
import Combine

protocol ChecklistModel_NavigationHandler: AnyObject {
    
    func perspectiveChecklistModel_DidRequestToBack(_ model: PerspectiveChecklistModel)
    func perspectiveChecklist_Model_DidRequestToFilter(
        _ model: PerspectiveChecklistModel,
        filterListData: GTAVK_FilterList_Data,
        selectedFilter: @escaping (String) -> ()
    )
    
}

final class PerspectiveChecklistModel {
    
    public var hideSpiner: (() -> Void)?
    
    var missionList: [PerspectiveMissionItem] = []
    var reloadData: AnyPublisher<Void, Never> {
        reloadDataSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private var filterSelected: String = ""
    private let navigationHandler: ChecklistModel_NavigationHandler
    private let reloadDataSubject = PassthroughSubject<Void, Never>()
    private var allMissionListItems: [PerspectiveMissionItem] = []
    private let defaults = UserDefaults.standard
    
    init(
        navigationHandler: ChecklistModel_NavigationHandler
    ) {
        
        self.navigationHandler = navigationHandler
        
        PerspectiveDBManager.shared.delegate = self
        if let isLoadedData = defaults.value(forKey: "gta_isReadyMissions") as? Bool, isLoadedData {
            perspectiveFetchData_Miss()
        }
    }
    
    func perspectiveBackAction_Proceeed() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        navigationHandler.perspectiveChecklistModel_DidRequestToBack(self)
        
    }
    
    func perspectiveFilterAction_Proceed() {
        let filterList = allMissionListItems.map { $0.categoryName }
        let uniqueList = Array(Set(filterList)).sorted()
        
        let filterListData = GTAVK_FilterList_Data(filterList: uniqueList, selectedItem: filterSelected)
        
        navigationHandler.perspectiveChecklist_Model_DidRequestToFilter(
            self,
            filterListData: filterListData) { [weak self] selectedFilter in
                
                guard let self = self else { return }
                
                self.filterSelected = selectedFilter
                
                if selectedFilter.isEmpty {
                    self.perspectiveFetchData_Miss()
                } else {
                    
                    
                    
                    
                    let list = self.allMissionListItems.filter { $0.categoryName == selectedFilter }
                    
                    
                    
                    self.missionList = list
                    
                    perspectiveFetchFilterData(filter: selectedFilter)
                    
                }
                
                self.reloadDataSubject.send()
                
            }
    }
    
    func perspectiveFetchFilterData(filter: String = "") {
        missionList.removeAll()
       // allMissionListItems.removeAll()
        
        do {
              let realm = try Realm()
              var missionsItem = realm.objects(PerspectiveMission_Object.self)
              
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
    
    
    
    
    
    func perspectiveFetchData_Miss() {
        missionList.removeAll()
        allMissionListItems.removeAll()

        do {
            let realm = try Realm()
            let missionsItem = realm.objects(PerspectiveMission_Object.self)
            let valueList = missionsItem.map { $0.lightweightRepresentation}
            
            valueList.forEach { [weak self] value in
                guard let self = self else { return }
                
                self.missionList.append(value)
            }
            allMissionListItems = missionList
            reloadDataSubject.send()
            hideSpiner?()
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }

    
    func perspectiveMissionIsCheck(_ index: Int, isCheck: Bool) {
        let selectedItem = missionList[index]
        do {
            let realm = try Realm()
            try! realm.write {
                if let existingMissionObject = realm.objects(PerspectiveMission_Object.self)
                    .filter("name == %@ AND category == %@", selectedItem.missionName, selectedItem.categoryName).first {
                    existingMissionObject.name = selectedItem.missionName
                    existingMissionObject.category = selectedItem.categoryName
 //                   existingMissionObject.isCheck = !selectedItem.isCheck
                    existingMissionObject.isCheck = isCheck
                    realm.add(existingMissionObject, update: .modified)
                }
                
            }
 //           missionList[index].isCheck = !missionList[index].isCheck
            missionList[index].isCheck = isCheck
           
          //  reloadDataSubject.send()  // Убрал и все работает!
            
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
}


extension PerspectiveChecklistModel: PerspectiveDBManagerDelegate {

    
    
    func perspective_isReady_Main() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
    }
    
    func perspective_isReady_GameList() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    func perspective_isReady_GameCodes() {
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
        perspectiveFetchData_Miss()
    }
    
    func perspective_isReady_GTA5Mods() { 
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        oneCheck()
    }
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
}
