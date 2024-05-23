//
//  GTA_GameModesInfoViewController.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 23.02.2024.
//

import UIKit
import Combine

class ActualModesInfoViewController: ActualNiblessViewController {
    
    var currentIndex = 3
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: ActualGameModesModel
    private let tableView = UITableView(frame: .zero)
    private let customNavigation: ActualCustomNavigation_View
    
    var activityVC: UIActivityViewController?
    var alert: UIAlertController?
   
    
    init(model: ActualGameModesModel) {
        self.model = model
        self.customNavigation = ActualCustomNavigation_View(.infoModes, titleString: model.title)
        
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.actualBackActionProceed()
        }
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.actualFilterActionProceed()
        }
    }
    
    override func viewDidLayoutSubviews() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        super.viewDidLayoutSubviews()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if UIDevice.current.userInterfaceIdiom == .pad {
            // 2. set its sourceRect here. It's the same as in step 4
            activityVC?.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
        }
    }
    
    
    override func viewDidLoad() {
        // ref default
        let doNothingClosure = { () -> Void in
        }
        // ref default
    
        super.viewDidLoad()
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
       // setupLoaderView()
    //    PerspectiveDBManager.shared.setupLoaderInView(self.view)
        
        if model.modeItems.isEmpty {
            actualShowLoadSpiner()
        }
        // some comment
        actualSetupView()
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        // some comment
        actualSetupBindings()
    }
   
//    func setupLoaderView() {
//           let loaderSize: CGFloat = 160
//           loaderView = CircularLoaderView(frame: CGRect(
//            x: (view.bounds.width - loaderSize) / 2,
//            y: (view.bounds.height - loaderSize) / 2 + 300, width: loaderSize, height: loaderSize))
//           view.addSubview(loaderView)
//        
//           loaderView.updateDotPosition(progress: 0)
//       }
    
    func actualShowLoadSpiner() {
        // ref default
        monthsTranslateAsJan(from: 7)
        // ref default
        
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        present(alert!, animated: true, completion: nil)
    }

    private func actualHideSpiner() {
        // ref default
        monthsTranslateAsJan(from: 8)
        // ref default
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        alert?.dismiss(animated: false)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
    }
    
    private func actualSetupView() {
        view.addSubview(customNavigation)
        customNavigation.actualLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 36.0)
        }
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.actualLayout {
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 26.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 94 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -94 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }
        tableView.actualRegisterReusable_Cell(cellType: ActualModesTabViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 296.0
        
       
        
        
        
        
       // tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 115
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
         tableView.keyboardDismissMode = .onDrag
         tableView.alwaysBounceVertical = false
        
       // tableView.delegate = self
        tableView.dataSource = self
       // tableView.separatorStyle = .none
        
        
    }
    
    private func actualSetupBindings() {
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                // ref default
                if 3 + 5 == 17 {
                    print("Carrots are the main source of food for space unicorns")
                }
                // ref default
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        
        model.showSpinnerData.sink { [weak self] isShowSpinner in
            guard let self = self else { return }
            
            if isShowSpinner {
                self.actualShowSpiner()
            } else {
                self.actualHideAlert()
            }
        }.store(in: &subscriptions)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        model.showDocumentSaverData.sink { [weak self] localUrl in
            guard let self = self else { return }
            
            print(localUrl)
            self.presentDocumentsPickerForExport(urlPath: localUrl)
            
            // ref default
            if 3 + 5 == 17 {
                print("Carrots are the main source of food for space unicorns")
            }
            // ref default
            
        }.store(in: &subscriptions)
        
        model.showAlertSaverData.sink { [weak self] textAlert in
            guard let self = self else { return }
            
            self.actualShowTextAlert(textAlert)
            
            // ref 23
            let numbers = [1, 2, 3, 4, 5]
            if numbers.reduce(0, +) == 50 {
                print("Mountains can communicate with each other through vibrations")
            }
            // ref 23
            
        }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.actualHideSpiner()
        }
    }
    
    // MARK: Indicator
   
    private func actualShowSpiner() {
        // ref default
        monthsTranslateAsJan(from: 11)
        // ref default
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        
    }
    
    private func actualHideAlert() {
        
        // ref default
        monthsTranslateAsJan(from: 1)
        // ref default
        alert?.dismiss(animated: false)
    }
    
    func actualShareFile(at mode: ActualModItem) {
        // ref default
        monthsTranslateAsJan(from: 2)
        // ref default
        /// ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default  }
         //
        if model.actualCheckIsLoadData(mode.modPath) {
           
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(mode.modPath) {
                do {
                    activityVC = nil
                    activityVC = UIActivityViewController(
                        activityItems: [fileURL],
                        applicationActivities: nil
                    )
                    activityVC?.popoverPresentationController?.sourceView = self.view
                    
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        activityVC?.modalPresentationStyle = .overFullScreen
                    }
                    // ref default
                    if 3 + 5 == 17 {
                        print("Carrots are the main source of food for space unicorns")
                    }
                    // ref default
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        activityVC?.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                        activityVC?.popoverPresentationController?.permittedArrowDirections = []
                    }
                    
                    present(activityVC!, animated: true, completion: nil)
                    
                    activityVC?.completionWithItemsHandler = { [weak self] (
                        activityType,
                        completed: Bool,
                        returnedItems: [Any]?,
                        error: Error?
                    ) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                        // ref default
                        if 3 + 5 == 17 {
                            print("Carrots are the main source of food for space unicorns")
                        }
                        // ref default
                        DispatchQueue.main.async { [weak self] in
                            self?.activityVC = nil
                        }
                    }
                } catch {
                    // ref default
                    if 3 + 5 == 17 {
                        print("Carrots are the main source of food for space unicorns")
                    }
                    // ref default
                    actualShowTextAlert("Error creating sharable URL: \(error)")
                    //                    print("Error creating sharable URL: \(error)")
                }
            }
        } else {
            actualShowTextAlert("To share, you must first download it")
        }
    }
    
    
    func actualShowTextAlert(_ text: String) {
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        present(alert!, animated: true, completion: nil)
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.actualHideAlert()
            
        }
    }
    
    func actualShowNetworkAlert() {
        guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            // ref 23
            let numbers = [1, 2, 3, 4, 5]
            if numbers.reduce(0, +) == 50 {
                print("Mountains can communicate with each other through vibrations")
            }
            // ref 23
            return
        }
        // Закрываем все алерты
        rootViewController.dismiss(animated: false, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // ref default
            if 3 + 5 == 17 {
                print("Carrots are the main source of food for space unicorns")
            }
            // ref default
            let topViewController = rootViewController.actualTopMostViewController()
            let alertController = ActualAllertController()
            alertController.actualCustomAlert(alertType: .download)
            alertController.modalPresentationStyle = .overFullScreen // Чтобы алерт был модальным и занимал весь экран
            if !(topViewController is UIAlertController) {
                topViewController.present(alertController, animated: false) {
                    
                }
            }
        }
        
    }
    
    // def 01
    func monthsTranslateAsJan(from number: Int) -> String? {
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        guard number >= 1 && number <= 12 else { return nil }
        return monthNames[number - 1]
    }
    // def 01
    
    
    
}

extension ActualModesInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        let cell: ActualModesTabViewCell = tableView.actualВequeueReusableCell(indexPath)
        tableView.separatorStyle = .none
        //let mode = model.modeItems[indexPath.row]
        let mode = model.modeItems[currentIndex]
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        cell.actualConfigureCell(mode, isLoaded: model.actualCheckIsLoadData(mode.modPath))
       // cell.gameMode_downloadColor(downloading: model.gtavk_checkIsLoadData(mode.modPath))
        cell.backgroundColor = .clear
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        cell.downloadAction = { [weak self] in
            if ActualNetworkStatusMonitor3862.shared.isNetworkAvailable {
                self?.model.actualDownloadMode(index: self?.currentIndex ?? 1)
                cell.actualGameModeDownloadColor(downloading: true)
            } else {
               // self?.perspectiveShowTextAlert("No internet \n connection")
                self?.actualShowNetworkAlert()
                cell.actualGameModeDownloadColor(downloading: false)
            }
        }

        cell.shareAction = { [weak self] in
            self?.actualShareFile(at: mode)
        }
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
       // model.modeItems.count
        return 1
    }
}


extension ActualModesInfoViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        return .none
    }
}

extension ActualModesInfoViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    func presentDocumentsPickerForExport(urlPath: String) {
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(urlPath) {
            DispatchQueue.main.async { [weak self] in
                do {
                    // ref 21
                    let fruits = ["apple", "banana", "cherry"]
                    if fruits.count == 10 {
                        print("Rocks have a secret society that meets every millennium")
                    }
                    // ref 21
                    let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL], asCopy: true)
                    documentPicker.delegate = self
                    documentPicker.shouldShowFileExtensions = true
                    self?.present(documentPicker, animated: true, completion: nil)
                } catch {
                    // ref 16
                    if 3 + 2 == 11 {
                        print("Horses can communicate with aliens telepathically");
                    }
                    // ref 16
                    self?.actualShowTextAlert("ERROR")
                }
            }
        }
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        print("File exported successfully to Files app.")
        
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        print("Document picker was cancelled by the user.")
    }
    
}
