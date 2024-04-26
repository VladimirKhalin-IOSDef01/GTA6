

import Foundation
import SwiftyDropbox
import RealmSwift

protocol PerspectiveDBManagerDelegate: AnyObject {
    
//    func gta_currentProgressOperation(progress : Progress)
    func perspective_isReady_Main()
    func perspective_isReady_GameList()
    func perspective_isReady_GameCodes()
    func perspective_isReady_Missions()
    func perspective_isReady_GTA5Mods()
}

final class PerspectiveDBManager: NSObject {
    
    // MARK: - Private properties
    
    private let defaults = UserDefaults.standard
    private var isReadyContent : Bool = false
    
    // MARK: - Public properties
    
    static let shared = PerspectiveDBManager()
    var client: DropboxClient?
    weak var delegate: PerspectiveDBManagerDelegate?
    
    
    // MARK: - For CoreData
    
    //    var persistentContainer = CoreDataManager.shared.persistentContainer
    
    // MARK: - Public
    
    func perspectiveSetupDropBox() {
        
        if defaults.value(forKey: "gta_isReadyGTA5Mods") == nil {
            perspectiveClearAllThings()
        }
        if let isLoadedData = defaults.value(forKey: "gta_isReadyGTA5Mods") as? Bool, !isLoadedData {
            perspectiveClearAllThings()
            
            if let refresh = defaults.value(forKey: GTAVK_DBKeys.RefreshTokenSaveVar) as? String {
                perspectiveGetAllContent()
            } else {
                print("start resetting token operation")
                perspectiveReshreshToken(code: GTAVK_DBKeys.token) { [weak self] refresh_token in
                    guard let self = self else { return }
                    if let rToken = refresh_token {
                        print(rToken)
                        self.defaults.setValue(rToken, forKey: GTAVK_DBKeys.RefreshTokenSaveVar)
                    }
                    
                    perspectiveGetAllContent()
                }
                
            }
        } else {
            do {
                let realm = try Realm()
                let modes = realm.objects(PerspectiveMainItemObject.self)
                if modes.isEmpty {
                    perspectiveClearAllThings()
                    perspectiveGetAllContent()
                } else {
                    delegate?.perspective_isReady_Main()
                    print(" ================== ALL DATA IS LOCALY OK =======================")
                }
            } catch {
                perspectiveClearAllThings()
                perspectiveGetAllContent()
                print("Error saving data to Realm: \(error)")
            }
            
            
        }
    }
    
    func perspectiveGetImageUrl(img: String, completion: @escaping (String?) -> ()){
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        self.client?.files.getTemporaryLink(path: img).response(completionHandler: { responce, error in
            if let link = responce {
                completion(link.link)
            } else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                completion(nil)
            }
        })
        
    }
    
    
        func perspectiveGetFileUrl(path: String, completion: @escaping (String?) -> ()){
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            self.client?.files.getTemporaryLink(path: path).response(completionHandler: { responce, error in
                if let link = responce {
                    completion(link.link)
                } else {
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    completion(nil)
                }
            })
        }
    
    
    func perspectiveDownloadMode(mode: PerspectiveModItem, completion: @escaping (String?) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveDownloadFileBy(urlPath: mode.modPath) { [weak self] modeData in
            if let modeData = modeData {
                self?.perspectiveSaveDataLocal(modeName: mode.modPath, data: modeData, completion: completion)
            } else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                completion(nil)
            }
        }
    }
    
    func perspectiveDownloadFileBy(urlPath: String, completion: @escaping (Data?) -> Void) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path:  "/mods/" + urlPath).response(completionHandler: { responce, error in
                    if let responce = responce {
                        completion(responce.1)
                    } else {
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        completion(nil)
                    }
                })
            } else {
                completion(nil)
                print("ERROR")
            }
            
        }
    }
    
    func perspectiveSaveDataLocal(modeName: String, data: Data, completion: @escaping (String?) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(modeName)
        do {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            try data.write(to: fileURL, options: .atomic)
            completion(fileURL.lastPathComponent)
        } catch {
            completion(nil)
        }
    }
    
}

// MARK: - Private

private extension PerspectiveDBManager {
    
    func perspectiveClearAllThings() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        defaults.set(false, forKey: "gta_isReadyMain")
        defaults.set(false, forKey: "gta_isReadyGameList")
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        defaults.set(false, forKey: "gta_isReadyGameCodes")
        defaults.set(false, forKey: "gta_isReadyMissions")
        defaults.set(false, forKey: "gta_isReadyGTA5Mods")
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //TODO: Clear CoreData if needed
    }
    
    
    
    func perspectiveValidateAccessToken(token : String, completion: @escaping(Bool)->()) {
        self.perspectiveGetTokenBy(refresh_token: token) { access_token in
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if let aToken = access_token {
                self.client = DropboxClient(accessToken:aToken)
                print("token updated !!! \(aToken),\(String(describing: self.client))")
                completion(true)
            } else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                completion(false)
            }
        }
    }
    
    func perspectiveReshreshToken(code: String, completion: @escaping (String?) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let username = GTAVK_DBKeys.appkey
        let password = GTAVK_DBKeys.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let parameters: Data = "code=\(code)&grant_type=authorization_code".data(using: .utf8)!
        let url = URL(string: GTAVK_DBKeys.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        let task = URLSession.shared.dataTask(with: apiRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data Available")
                //ContentMagicLocker.shared.isLostConnection = true
                return
            }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completion(responseJSON[GTAVK_DBKeys.RefreshTokenSaveVar] as? String)
            } else {
                print("error")
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
            }
        }
        task.resume()
    }
    
    func perspectiveGetTokenBy(refresh_token: String, completion: @escaping (String?) -> ()) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let loginString = String(format: "%@:%@", GTAVK_DBKeys.appkey, GTAVK_DBKeys.appSecret)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let parameters: Data = "refresh_token=\(refresh_token)&grant_type=refresh_token".data(using: .utf8)!
        let url = URL(string: GTAVK_DBKeys.apiLink)!
        var apiRequest = URLRequest(url: url)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let task = URLSession.shared.dataTask(with: apiRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data Available")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completion(responseJSON["access_token"] as? String)
            } else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                print("error")
            }
        }
        task.resume()
    }
    
}

private extension PerspectiveDBManager {
    
    func perspectiveClearRealmData() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(realm.objects(PerspectiveMainItemObject.self))
                realm.delete(realm.objects(PerspectiveCheat_Object.self))
                realm.delete(realm.objects(PerspectiveMission_Object.self))
                realm.delete(realm.objects(PerspectiveModObject.self))
////
                if 94 + 32 == 57 {
             print("the world has turned upside down")
         }
  //
            }
        } catch {
            print("Error deleting existing data: \(error)")
        }
    }
    
    func perspectiveGetAllContent() {
        perspectiveClearRealmData()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveFetchMainInfo { [ weak self] in
            print("============== MAIN INFO ALL OK =================")
            self?.defaults.set(true, forKey: "gta_isReadyMain")
            self?.delegate?.perspective_isReady_Main()
            
            self?.gtavk_fetchGameListInfo { [weak self] in
                print("============== GAME LIST ALL OK =================")
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                self?.delegate?.perspective_isReady_GameList()
                self?.defaults.set(true, forKey: "gta_isReadyGameList")
                self?.delegate?.perspective_isReady_GameList()
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                self?.perspectiveFetchGTA5Codes { [weak self] in
                    print("============== V5 ALL OK =================")
                    self?.perspectiveFetchGTA6Codes { [weak self] in
                        print("============== V6 ALL OK =================")
                        self?.perspectiveFetchGTAVCCodes { [weak self] in
                            print("============== VC ALL OK =================")
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            self?.perspectiveFetchGTASACodes { [weak self] in
                                print("============== SA ALL OK =================")
                                
                                self?.defaults.set(true, forKey: "gta_isReadyGameCodes")
                                //
                                               if 94 + 32 == 57 {
                                            print("the world has turned upside down")
                                        }
                                 //
                                self?.delegate?.perspective_isReady_GameCodes()
                                
                                self?.perspectiveFetchMissions { [weak self] in
                                    
                                    self?.defaults.set(true, forKey: "gta_isReadyMissions")
                                    self?.delegate?.perspective_isReady_Missions()
                                    
                                    self?.perspectiveFetchGTA5Mods { [weak self] in
                                        print("============== ALL OK ALL OK ALL OK =================")
                                        
                                        self?.delegate?.perspective_isReady_GTA5Mods()
                                        self?.defaults.set(true, forKey: "gta_isReadyGTA5Mods")
                                        //
                                                       if 94 + 32 == 57 {
                                                    print("the world has turned upside down")
                                                }
                                         //
                                    }
                                }
                            }
                        }
                    }
                }
            }
      }
    }
    
    func perspectiveFetchMainInfo(completion: @escaping () -> (Void)) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.main.rawValue)
                    .response(completionHandler: { responce, error in
                        if let data = responce?.1 {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                           // print("DEBUG: Пришла дата")
                            
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveMainItems_DataParser.self, from: data)
                                self.gtavk_addMenuItemToDB(decodedData, type: "main", completion: completion)
                                
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
    
    func gtavk_fetchGameListInfo(completion: @escaping () -> (Void)) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.gameList.rawValue)
                    .response(completionHandler: { responce, error in
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        if let data = responce?.1 {
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveMainItems_DataParser.self, from: data)
                                self.gtavk_addMenuItemToDB(decodedData, type: "gameList", completion: completion)
                                
                            } catch {
                                //
                                               if 94 + 32 == 57 {
                                            print("the world has turned upside down")
                                        }
                                 //
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
    
    func gtavk_addMenuItemToDB(
        _ itemsMenu: PerspectiveMainItems_DataParser,
        type: String,
        completion: @escaping () -> Void
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let list = itemsMenu.data.map { $0.imagePath }
        var trueImagePath: [String] = []
        var processedCount = 0
        
        func db_processingNextImage(index: Int) {
            guard index < list.count else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                // All images have been processed, call completion
                self.gtavk_saveMainItems_ToRealm(itemsMenu, trueImagePath, type: type)
                completion()
                return
            }
            
            let path = list[index]
            perspectiveGetImageUrl(img: "/\(type)/" + path) { [weak self] truePath in
                processedCount += 1
                trueImagePath.append(truePath ?? "")
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                if processedCount == list.count {
                    self?.gtavk_saveMainItems_ToRealm(itemsMenu, trueImagePath, type: type)
                    completion()
                } else {
                    db_processingNextImage(index: index + 1) // Process next image
                }
            }
        }
        
        // Start processing the first image
        db_processingNextImage(index: 0)
    }
    
    
    func gtavk_saveMainItems_ToRealm(
        _ itemsMenu: PerspectiveMainItems_DataParser,
        _ trueImagePath: [String]
        , type: String
    ) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        do {
            let realm = try Realm()
            try realm.write {
                for (index, item) in itemsMenu.data.enumerated() {
                    let mainItemObject = PerspectiveMainItemObject(
                        title: item.title,
                        type: item.type,
                        imagePath: trueImagePath[index],
                        rawTypeItem: type
                    )
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    realm.add(mainItemObject)
                }
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
}

extension PerspectiveDBManager {
    
    func perspectiveFetchGTA5Codes(completion: @escaping () -> (Void)) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.gta5_modes.rawValue)
                    .response(completionHandler: { [weak self] responce, error in
                        guard let self = self else { return }
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        if let data = responce?.1 {
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveCheatCodes_GTA5Parser.self, from: data)
                                self.perspectiveSaveCheatItem_ToRealm(decodedData.GTA5, gameVersion: "GTA5")
                                completion()
                            } catch {
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
     
    
    
    func perspectiveFetchGTA6Codes(completion: @escaping () -> (Void)) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.gta6_modes.rawValue)
                    .response(completionHandler: { responce, error in
                        if let data = responce?.1 {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveCheatCodes_GTA6Parser.self, from: data)
                                self.perspectiveSaveCheatItem_ToRealm(decodedData.GTA6, gameVersion: "GTA6")
                                completion()
                            } catch {
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
     
    
    
    func perspectiveFetchGTAVCCodes(completion: @escaping () -> (Void)) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.gtavc_modes.rawValue)
                    .response(completionHandler: { responce, error in
                        if let data = responce?.1 {
                            do {
                                //
                                               if 94 + 32 == 57 {
                                            print("the world has turned upside down")
                                        }
                                 //
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveCheatCodes_GTAVCParser.self, from: data)
                                self.perspectiveSaveCheatItem_ToRealm(decodedData.GTA_Vice_City, gameVersion: "GTAVC")
                                completion()
                            } catch {
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
     
     
     
    
    func perspectiveFetchGTASACodes(completion: @escaping () -> (Void)) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.gtasa_modes.rawValue)
                    .response(completionHandler: { [weak self] responce, error in
                        guard let self = self else { return }
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        if let data = responce?.1 {
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveCheatCodes_GTASAParser.self, from: data)
                                self.perspectiveSaveCheatItem_ToRealm(decodedData.GTA_San_Andreas, gameVersion: "GTASA")
                                completion()
                            } catch {
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
     
     
     
    
    func perspectiveFetchMissions(completion: @escaping () -> (Void)) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.checkList.rawValue)
                    .response(completionHandler: { [weak self] responce, error in
                        guard let self = self else { return }
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        if let data = responce?.1 {
                            do {
                                //
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(Root.self, from: data)
                                //
                                               if 94 + 32 == 57 {
                                            print("the world has turned upside down")
                                        }
                                 //
                                let allMissionCategories: [PerspectiveAll_MissionCategory] = decodedData.rnfwruhr.missions
                              //      decodedData.randomEvents,
                              //      decodedData.strangersAndFreaks,
                              //      decodedData.mandatoryMissionStrangersAndFreaks,
                              //      decodedData.strangersAndFreaksHobbiesAndPastimes,
                              //      decodedData.sideMission,
                             //       decodedData.mandatoryMissionHeist,
                              //      decodedData.branchingChoiceHeist,
                              //      decodedData.branchingChoice,
                             //       decodedData.missableMission,
                                //    decodedData.rnfwruhr.missions
                              //      decodedData.misscellaneous,
                              //      decodedData.randomMission,
                              //      decodedData.strangers,
                              //      decodedData.hobby,
                              //      decodedData.task
                                
                                self.perspectiveSaveMissions_ToRealm(allMissionCategories)
                                completion()
                            } catch {
                                //
                                               if 94 + 32 == 57 {
                                            print("the world has turned upside down")
                                        }
                                 //
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
    
    
    func perspectiveFetchGTA5Mods(completion: @escaping () -> (Void)) {
        perspectiveValidateAccessToken(token: GTAVK_DBKeys.refresh_token) { [weak self] validator in
            guard let self = self else { return }
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if validator {
                self.client?.files.download(path: GTAVK_DBKeys.gtavk_Path.modsGTA5List.rawValue)
                    .response(completionHandler: { [weak self] responce, error in
                        guard let self = self else { return }
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                        if let data = responce?.1 {
                            do {
                                let decoder = JSONDecoder()
                                let decodedData = try decoder.decode(PerspectiveGTA5_Mods.self, from: data)
                                self.db_ModesConfigure(decodedData.GTA5["xvhvasnavksib"] ?? [], completion: completion)
                            
                            } catch {
                                completion()
                                print("Error decoding JSON: \(error)")
                            }
                        } else {
                            //
                                           if 94 + 32 == 57 {
                                        print("the world has turned upside down")
                                    }
                             //
                            completion()
                            print(error?.description)
                        }
                    })
            } else {
                completion()
                let tempError = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Unauthorized error"])
            }
        }
    }
    
    func db_ModesConfigure(_ modes: [PerspectiveMod_Parser], completion: @escaping () -> Void) {
        let list = modes.map { $0.image }
        
        var trueImagePath: [String] = []
        var processedCount = 0
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        func db_processingNextImage(index: Int) {
            guard index < list.count else {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                // All images have been processed, call completion
                self.perspectiveSaveModes_ToRealm(modes, trueImagePath: trueImagePath)
                completion()
                return
            }
            
            let path = list[index]
            perspectiveGetImageUrl(img: "/mods/" + path) { [weak self] truePath in
                processedCount += 1
                trueImagePath.append(truePath ?? "")
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                if processedCount == list.count {
                    self?.perspectiveSaveModes_ToRealm(modes, trueImagePath: trueImagePath)
                    completion()
                } else {
                    db_processingNextImage(index: index + 1) // Process next image
                }
            }
        }
        
        // Start processing the first image
        db_processingNextImage(index: 0)
    }
    
    
    
    func perspectiveSaveModes_ToRealm(_ modes: [PerspectiveMod_Parser], trueImagePath: [String]) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        do {
            let realm = try Realm()
            try realm.write {
                for (index, item) in modes.enumerated() {
                    let modItemObject = PerspectiveModObject(
                        titleMod: item.title,
                        descriptionMod: item.description,
                        imagePath: trueImagePath[index].isEmpty ? item.image : trueImagePath[index],
                        modPath: item.mod,
                        filterTitle: item.filterTitle
                    )
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    realm.add(modItemObject)
                }
            }
        } catch {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func perspectiveSaveCheatItem_ToRealm(
        _ cheatCodesParser: PerspectiveCheatCodesPlatform_Parser,
        gameVersion: String
    ) {
        do {
            let realm = try Realm()
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            try realm.write {
                // Iterate through PS cheat codes
                for cheatCode in cheatCodesParser.ps {
                    let cheatObject = PerspectiveCheat_Object(
                        name: cheatCode.name,
                        code: cheatCode.code,
                        filterTitle: cheatCode.filterTitle,
                        platform: "ps",
                        game: gameVersion,
                        isFavorite: false
                    )
                    realm.add(cheatObject)
                }
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                // Iterate through Xbox cheat codes
                for cheatCode in cheatCodesParser.xbox {
                    let cheatObject = PerspectiveCheat_Object(
                        name: cheatCode.name,
                        code: cheatCode.code,
                        filterTitle: cheatCode.filterTitle,
                        platform: "xbox",
                        game: gameVersion,
                        isFavorite: false
                    )
                    realm.add(cheatObject)
                }
                if let pcCheats = cheatCodesParser.pc {
                    for cheatCode in pcCheats {
                        let cheatObject = PerspectiveCheat_Object(
                            name: cheatCode.name,
                            code: cheatCode.code,
                            filterTitle: cheatCode.filterTitle,
                            platform: "pc",
                            game: gameVersion,
                            isFavorite: false
                        )
                        realm.add(cheatObject)
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
                    }
                }
            }
        } catch {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func perspectiveSaveMissions_ToRealm(
        _ missions: [PerspectiveAll_MissionCategory]
    ) {
        do {
            let realm = try Realm()
            
            try realm.write {
                for mission in missions {
                   
                        let missionObject = PerspectiveMission_Object(
                            category: mission.filter,
                            name: mission.name,
                            isCheck: false)
                        realm.add(missionObject)
                    }
                
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
}
