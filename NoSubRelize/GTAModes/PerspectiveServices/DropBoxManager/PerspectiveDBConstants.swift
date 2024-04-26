import Foundation

struct GTAVK_DBKeys {
    
    static let RefreshTokenSaveVar = "refresh_token"
    
    static let appkey = "edrwnb9zlrqpmc4"
    static let appSecret = "x06ouknobnrivso"
    static let token = "k_NEn1_GHiMAAAAAAAAA1LhxTet_j7HydCHg8VFQuGw"
    static let refresh_token = "DziuHCVuEe0AAAAAAAAAARW5Mzi9un9WVMGpxLH-D8ZF3QaJHFCT7RticNQyuCBm"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"

    enum gtavk_Path: String {
        case gtasa_modes = "/cheats/version-SA/version-SA.json"
        case gtavc_modes = "/cheats/version-VC/version-VC.json"
        case gta5_modes = "/cheats/version-5/version-5.json"
        case gta6_modes = "/cheats/version-6/version-6.json"
        case main = "/main/main.json"
        case gameList = "/gameList/gamelist.json"
        case checkList = "/Checklist/checklist.json"
        case modsGTA5List = "/mods/content.json"

    }
}



