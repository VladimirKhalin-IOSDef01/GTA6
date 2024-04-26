

import Foundation
import RealmSwift

struct PerspectiveCheatCode_Parser: Codable {
    let name: String
    let code: [String]
    let filterTitle: String
    
    private enum CodingKeys_andRename : String, CodingKey {
        case name = "AVHnmaskbn128"
        case code = "AVHnmaskbn127"
        case filterTitle = "AVHnmaskbn126"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode([String].self, forKey: .code)
        filterTitle = try container.decode(String.self, forKey: .filterTitle)
    }
}

struct PerspectiveCheatCodesPlatform_Parser: Codable {
    let ps: [PerspectiveCheatCode_Parser]
    let xbox: [PerspectiveCheatCode_Parser]
    let pc: [PerspectiveCheatCode_Parser]?
    
    private enum CodingKeys_andRename: String, CodingKey {
        case ps = "vmi51ovaCMs7"
        case xbox = "vmi51ovaCMs6"
        case pc = "vmi51ovaCMs5"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        ps = try container.decode([PerspectiveCheatCode_Parser].self, forKey: .ps)
        xbox = try container.decode([PerspectiveCheatCode_Parser].self, forKey: .xbox)
        pc = try container.decodeIfPresent([PerspectiveCheatCode_Parser].self, forKey: .pc)
    }
}

struct PerspectiveCheatCodes_GTA5Parser: Codable {
    let GTA5: PerspectiveCheatCodesPlatform_Parser
    
    private enum CodingKeys_andRename: String, CodingKey {
        case GTA5 = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        GTA5 = try container.decode(PerspectiveCheatCodesPlatform_Parser.self, forKey: .GTA5)
    }
}

struct PerspectiveCheatCodes_GTA6Parser: Codable {
    let GTA6: PerspectiveCheatCodesPlatform_Parser
    
    private enum CodingKeys_andRename: String, CodingKey {
        case GTA6 = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        GTA6 = try container.decode(PerspectiveCheatCodesPlatform_Parser.self, forKey: .GTA6)
    }
}

struct PerspectiveCheatCodes_GTASAParser: Codable {
    let GTA_San_Andreas: PerspectiveCheatCodesPlatform_Parser
    
    private enum CodingKeys_andRename: String, CodingKey {
        case GTA_San_Andreas = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        GTA_San_Andreas = try container.decode(PerspectiveCheatCodesPlatform_Parser.self, forKey: .GTA_San_Andreas)
    }
}

struct PerspectiveCheatCodes_GTAVCParser: Codable {
    let GTA_Vice_City: PerspectiveCheatCodesPlatform_Parser
    
    private enum CodingKeys_andRename: String, CodingKey {
        case GTA_Vice_City = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_andRename.self)
        GTA_Vice_City = try container.decode(PerspectiveCheatCodesPlatform_Parser.self, forKey: .GTA_Vice_City)
    }
}

public struct PerspectiveCheat_Item {
    
    var name: String = ""
    var code: [String] = []
    var filterTitle: String = ""
    var platform: String = ""
    var game: String = ""
    var isFavorite: Bool = false
    
    init(name: String, code: [String], filterTitle: String, platform: String, game: String, isFavorite: Bool) {
        self.name = name
        self.code = code
        self.filterTitle = filterTitle
        self.platform = platform
        self.game = game
        self.isFavorite = isFavorite
    }
}

public final class PerspectiveCheat_Object: Object {
    
    @objc dynamic private(set) var id: String = UUID().uuidString.lowercased()
    @objc dynamic var name: String = ""
    var code = List<String>()
    @objc dynamic var filterTitle: String = ""
    @objc dynamic var platform: String = ""
    @objc dynamic var game: String = ""
    @objc dynamic var isFavorite: Bool = false
    
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
        return #keyPath(PerspectiveCheat_Object.id)
    }
    
    convenience init(
        name: String,
        code: [String],
        filterTitle: String,
        platform: String,
        game: String,
        isFavorite: Bool
    ) {
        self.init()
        self.name = name
        self.code.append(objectsIn: code)
        self.filterTitle = filterTitle
        self.platform = platform
        self.game = game
        self.isFavorite = isFavorite
    }
    
    var lightweightRepresentation: PerspectiveCheat_Item {
        //
        if 94 + 32 == 57 {
            print("the world has turned upside down")
        }
        //
        return PerspectiveCheat_Item(
            name: name,
            code: Array(code),
            filterTitle: filterTitle,
            platform: platform,
            game: game,
            isFavorite: isFavorite
        )
    }
}
