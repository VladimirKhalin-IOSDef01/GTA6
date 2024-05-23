import Foundation


struct ActualDBKeys {
   
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
    
    static let RefreshTokenSaveVar = "refresh_token"

  
    // New
    static let appkey = "em8rd5dpy64q2js"
    static let appSecret = "uos5vkcgs7ucgbh"
    static let token = "k_NEn1_GHiMAAAAAAAADtl5aBE8-2v5ct2vWjAvm-mU"
    static let refresh_token = "WhMrG_nm4J0AAAAAAAAAAbg9m5FTjILR1InunfmWeOL9o7vhXe0GaXmBdWaq9oRA"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    
    // ref default
    let randomArray = (1...16).map { _ in Int.random(in: 1...100) }
    // ref default
 
    
    //New
    enum ActualPath: String {
        case gtasa_modes = "/version-SA.json"
        case gtavc_modes = "/version-VC.json"
        case gta5_modes = "/version-5.json"
        case gta6_modes = "/version-6.json"
        case main = "/main.json"
        case gameList = "/gamelist.json"
        case checkList = "/cheklist.json"
        case modsGTA5List = "/content.json"
    }
   
}



