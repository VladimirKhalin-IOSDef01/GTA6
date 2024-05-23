//
//  MainItemObject.swift
//  GTAModes
//
//  Created by Максим Педько on 10.08.2023.
//

import Foundation
import RealmSwift

public struct ActualMainItemsDataParser: Codable {
    
    public let data: [ActualMainItemParser]
    
    enum ActualCodingKeysAndRename: String, CodingKey {
        case data = "ubsakvasn16"
        
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    public init(from decoder: Decoder) throws {
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        data = try container.decode([ActualMainItemParser].self, forKey: .data)
    }
}

public struct ActualMainItemParser: Codable {
    
    public let title: String
    public let type: String
    public let imagePath: String
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case title = "CASKm6"
        case type = "CASKm7"
        case imagePath = "CASKm8"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    public init(from decoder: Decoder) throws {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        title = try container.decode(String.self, forKey: .title)
        type = try container.decode(String.self, forKey: .type)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        imagePath = try container.decode(String.self, forKey: .imagePath)
    }
    
}

public struct ActualMainItem {
    
    public var title: String = ""
    public var type: String = ""
    public var imagePath: String = ""
    public var typeItem: ActualMenuItemType
    
    init(title: String, type: String, imagePath: String, typeItem: ActualMenuItemType) {
        self.title = title
        self.type = type
        self.imagePath = imagePath
        self.typeItem = typeItem
    }
}

public enum ActualMenuItemType: String, Decodable {
    
    case main, gameSelection
    //, gameList
}

public final class ActualMainItemObject: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var type: String = ""
    // ref default
    let randomArray = (1...63).map { _ in Int.random(in: 1...100) }
    // ref default
    @objc dynamic var imagePath: String = ""
    @objc dynamic var rawTypeItem: String = ""
    // ref default
    var set: Set<Int> = []
    // ref default
    
    public var typeItem: ActualMenuItemType {
        
        ActualMenuItemType(rawValue: rawTypeItem) ?? .main
        // MenuItemType(rawValue: rawTypeItem) ?? .gameSelection
    }
    
    convenience init(
        title: String,
        type: String,
        imagePath: String,
        rawTypeItem: String
    ) {
        self.init()
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        self.title = title
        self.type = type
        self.imagePath = imagePath
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        self.rawTypeItem = rawTypeItem
        
    }
    
    var lightweightRepresentation: ActualMainItem {
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        // print(title, type, imagePath, typeItem )
        return ActualMainItem(title: title, type: type, imagePath: imagePath, typeItem: typeItem)
        
    }
    
}
