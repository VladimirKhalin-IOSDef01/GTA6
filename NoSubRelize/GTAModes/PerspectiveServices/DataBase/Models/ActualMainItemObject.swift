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
    
    enum CodingKeys_andRename: String, CodingKey {
        case data = "ubsakvasn16"
        
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        data = try container.decode([ActualMainItemParser].self, forKey: .data)
    }
}

public struct ActualMainItemParser: Codable {
    
    public let title: String
    public let type: String
    public let imagePath: String
    
    private enum CodingKeys_andRename: String, CodingKey {
        case title = "CASKm6"
        case type = "CASKm7"
        case imagePath = "CASKm8"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        title = try container.decode(String.self, forKey: .title)
        type = try container.decode(String.self, forKey: .type)
        imagePath = try container.decode(String.self, forKey: .imagePath)
    }
    
}

public struct ActualMainItem {
    
    public var title: String = ""
    public var type: String = ""
    public var imagePath: String = ""
    public var typeItem: MenuItemType
    
    init(title: String, type: String, imagePath: String, typeItem: MenuItemType) {
        self.title = title
        self.type = type
        self.imagePath = imagePath
        self.typeItem = typeItem
    }
}

public enum MenuItemType: String, Decodable {
    
    case main, gameSelection
    //, gameList
}

public final class ActualMainItemObject: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var imagePath: String = ""
    @objc dynamic var rawTypeItem: String = ""
    
 
    
    public var typeItem: MenuItemType {
        MenuItemType(rawValue: rawTypeItem) ?? .main
        // MenuItemType(rawValue: rawTypeItem) ?? .gameSelection
    }
    
    convenience init(
        title: String,
        type: String,
        imagePath: String,
        rawTypeItem: String
    ) {
        self.init()
        
        self.title = title
        self.type = type
        self.imagePath = imagePath
        self.rawTypeItem = rawTypeItem
        
    }
    
    var lightweightRepresentation: ActualMainItem {
        // print(title, type, imagePath, typeItem )
        return ActualMainItem(title: title, type: type, imagePath: imagePath, typeItem: typeItem)
        
    }
    
}
