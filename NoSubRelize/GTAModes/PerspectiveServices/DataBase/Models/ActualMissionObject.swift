//
//  MissionObject.swift
//  GTAModes
//
//  Created by Максим Педько on 15.08.2023.
//

import Foundation
import RealmSwift

    struct ActualMissionCategory: Codable {
        let filter: String
        let name: String
        
        // Specify the coding keys to match JSON structure.
        private enum CodingKeys_andRename: String, CodingKey {
            case filter
            case name = "hfhju8900"
        }
        init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
                filter = try container.decode(String.self, forKey: .filter)
                name = try container.decode(String.self, forKey: .name)
            }
    }

    // Define the Checklist struct to hold the list of missions.
    struct Checklist: Codable {
        let missions: [ActualMissionCategory]
        
        // Specify the coding keys to match JSON structure.
        private enum CodingKeys_andRename: String, CodingKey {
            case missions = "Cheklist"
        }
        init(from decoder: Decoder) throws {
               let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
               missions = try container.decode([ActualMissionCategory].self, forKey: .missions)
           }
    }

    // Define the top-level struct to match the JSON structure.
    struct Root: Codable {
        let rnfwruhr: Checklist
        
        // Specify the coding keys to match JSON structure.
        private enum CodingKeys_andRename: String, CodingKey {
            case rnfwruhr
        }
        init(from decoder: Decoder) throws {
              let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
              rnfwruhr = try container.decode(Checklist.self, forKey: .rnfwruhr)
          }
    }


struct ActualMission_Parser: Codable {
   
    let mandatoryMission: ActualMissionCategory

    private enum CodingKeys_andRename: String, CodingKey {
        case mandatoryMission = "rnfwruhr"
    }
    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
           mandatoryMission = try container.decode(ActualMissionCategory.self, forKey: .mandatoryMission)
       }
       
}

public struct ActualMissionItem {
    var categoryName: String = ""
    var missionName: String = ""
    var isCheck: Bool = false
    
    
    init(categoryName: String, missionName: String, isCheck: Bool) {
        self.categoryName = categoryName
        self.missionName = missionName
        self.isCheck = isCheck
    }
}

public final class ActualMissionObject: Object {
    
    @objc dynamic private(set) var id: String = UUID().uuidString.lowercased()
    @objc dynamic var category: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var isCheck: Bool = false
    
    override public static func primaryKey() -> String? {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return #keyPath(ActualMissionObject.id)
    }

    convenience init(
        category: String,
        name: String,
        isCheck: Bool
    ) {
        self.init()
        self.category = category
        self.name = name
        self.isCheck = isCheck
    }
    
    var lightweightRepresentation: ActualMissionItem {
        return ActualMissionItem(categoryName: category, missionName: name, isCheck: isCheck)
    }
    
}



