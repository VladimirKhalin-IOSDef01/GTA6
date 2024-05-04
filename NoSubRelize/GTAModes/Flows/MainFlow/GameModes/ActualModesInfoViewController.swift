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
    
        super.viewDidLoad()
        
       // setupLoaderView()
    //    PerspectiveDBManager.shared.setupLoaderInView(self.view)
        
        if model.modeItems.isEmpty {
            actualShowLoadSpiner()
        }
        // some comment
        actualSetupView()
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
        
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        present(alert!, animated: true, completion: nil)
    }

    private func actualHideSpiner() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        alert?.dismiss(animated: false)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    
    private func actualSetupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -50 : -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 44 : 36.0)
        }
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.perspectiveLayout {
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 26.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 94 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -94 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }
        tableView.registerReusable_Cell(cellType: ActualModesTabViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 296.0
       // tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 115
       
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
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
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
        
        model.showDocumentSaverData.sink { [weak self] localUrl in
            guard let self = self else { return }
            
            print(localUrl)
            self.presentDocumentsPickerForExport(urlPath: localUrl)
            
            
            
        }.store(in: &subscriptions)
        
        model.showAlertSaverData.sink { [weak self] textAlert in
            guard let self = self else { return }
            
            self.actualShowTextAlert(textAlert)
            
            
            
        }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.actualHideSpiner()
        }
    }
    
    // MARK: Indicator
   
    private func actualShowSpiner() {

        
    }
    
    private func actualHideAlert() {
        alert?.dismiss(animated: false)
    }
    
    func perspectiveShareFile(at mode: ActualModItem) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
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
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
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
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.activityVC = nil
                        }
                    }
                } catch {
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    actualShowTextAlert("Error creating sharable URL: \(error)")
                    //                    print("Error creating sharable URL: \(error)")
                }
            }
        } else {
            actualShowTextAlert("To share, you must first download it")
        }
    }
    
    
    func actualShowTextAlert(_ text: String) {
        alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        present(alert!, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.actualHideAlert()
            
        }
    }
    
    func actualShowNetworkAlert() {
        guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return
        }
        // Закрываем все алерты
        rootViewController.dismiss(animated: false, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let topViewController = rootViewController.topMostViewController()
            let alertController = ActualAllertController()
            alertController.actualCustomAlert(alertType: .download)
            alertController.modalPresentationStyle = .overFullScreen // Чтобы алерт был модальным и занимал весь экран
            if !(topViewController is UIAlertController) {
                topViewController.present(alertController, animated: false) {
                    
                }
            }
        }
        
    }
}

extension ActualModesInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ActualModesTabViewCell = tableView.dequeueReusableCell(indexPath)
        //let mode = model.modeItems[indexPath.row]
        let mode = model.modeItems[currentIndex]
        cell.actualConfigureCell(mode, isLoaded: model.actualCheckIsLoadData(mode.modPath))
       // cell.gameMode_downloadColor(downloading: model.gtavk_checkIsLoadData(mode.modPath))
        cell.backgroundColor = .clear
        
        cell.downloadAction = { [weak self] in
            if ActualNetworkStatusMonitor.shared.isNetworkAvailable {
                self?.model.actualDownloadMode(index: self?.currentIndex ?? 1)
                cell.actualGameModeDownloadColor(downloading: true)
            } else {
               // self?.perspectiveShowTextAlert("No internet \n connection")
                self?.actualShowNetworkAlert()
                cell.actualGameModeDownloadColor(downloading: false)
            }
        }

        cell.shareAction = { [weak self] in
            self?.perspectiveShareFile(at: mode)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // model.modeItems.count
        1
    }
}


extension ActualModesInfoViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension ActualModesInfoViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    func presentDocumentsPickerForExport(urlPath: String) {
        
        if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(urlPath) {
            DispatchQueue.main.async { [weak self] in
                do {
                    let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL], asCopy: true)
                    documentPicker.delegate = self
                    documentPicker.shouldShowFileExtensions = true
                    self?.present(documentPicker, animated: true, completion: nil)
                } catch {
                    self?.actualShowTextAlert("ERROR")
                }
            }
        }
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print("File exported successfully to Files app.")
        
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Document picker was cancelled by the user.")
    }
    
}
