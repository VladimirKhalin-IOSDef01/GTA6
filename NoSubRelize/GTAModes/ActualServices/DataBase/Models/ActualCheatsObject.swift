

import Foundation
import RealmSwift

struct ActualCheatCodeParser: Codable {
    let name: String
    let code: [String]
    let filterTitle: String
    
    private enum ActualCodingKeysAndRename : String, CodingKey {
        case name = "AVHnmaskbn128"
        case code = "AVHnmaskbn127"
        case filterTitle = "AVHnmaskbn126"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode([String].self, forKey: .code)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        filterTitle = try container.decode(String.self, forKey: .filterTitle)
    }
}

struct ActualCheatCodesPlatformParser: Codable {
    let ps: [ActualCheatCodeParser]
    let xbox: [ActualCheatCodeParser]
    let pc: [ActualCheatCodeParser]?
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case ps = "vmi51ovaCMs7"
        case xbox = "vmi51ovaCMs6"
        case pc = "vmi51ovaCMs5"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        ps = try container.decode([ActualCheatCodeParser].self, forKey: .ps)
        xbox = try container.decode([ActualCheatCodeParser].self, forKey: .xbox)
        pc = try container.decodeIfPresent([ActualCheatCodeParser].self, forKey: .pc)
    }
}

struct ActualCheatCodesGTA5Parser: Codable {
    let GTA5: ActualCheatCodesPlatformParser
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case GTA5 = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        GTA5 = try container.decode(ActualCheatCodesPlatformParser.self, forKey: .GTA5)
    }
}

struct ActualCheatCodesGTA6Parser: Codable {
    
    let GTA6: ActualCheatCodesPlatformParser
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case GTA6 = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        GTA6 = try container.decode(ActualCheatCodesPlatformParser.self, forKey: .GTA6)
    }
}

struct ActualCheatCodesGTASAParser: Codable {
    let GTA_San_Andreas: ActualCheatCodesPlatformParser
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case GTA_San_Andreas = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        GTA_San_Andreas = try container.decode(ActualCheatCodesPlatformParser.self, forKey: .GTA_San_Andreas)
    }
}

struct ActualCheatCodesGTAVCParser: Codable {
    let GTA_Vice_City: ActualCheatCodesPlatformParser
    
    private enum ActualCodingKeysAndRename: String, CodingKey {
        case GTA_Vice_City = "kbias-kvsaj5612k"
    }
    // Кастомный инициализатор, использующий CodingKeys_andRename
    init(from decoder: Decoder) throws {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        let container = try decoder.container(keyedBy: ActualCodingKeysAndRename.self)
        GTA_Vice_City = try container.decode(ActualCheatCodesPlatformParser.self, forKey: .GTA_Vice_City)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
    }
}

public struct ActualCheatItem {
    
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

public final class ActualCheatObject: Object {
    
    @objc dynamic private(set) var id: String = UUID().uuidString.lowercased()
    @objc dynamic var name: String = ""
    var code = List<String>()
    @objc dynamic var filterTitle: String = ""
    @objc dynamic var platform: String = ""
    @objc dynamic var game: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override public static func primaryKey() -> String? {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        return #keyPath(ActualCheatObject.id)
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
    
    var lightweightRepresentation: ActualCheatItem {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        return ActualCheatItem(
            name: name,
            code: Array(code),
            filterTitle: filterTitle,
            platform: platform,
            game: game,
            isFavorite: isFavorite
        )
    }
}
