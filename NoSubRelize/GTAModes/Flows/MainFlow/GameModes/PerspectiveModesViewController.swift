
import UIKit
import Combine

class PerspectiveModesViewController: PerspectiveNiblessViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: PerspectiveGameModesModel
    private let modelScreen: PerspectiveMainModel
    private let tableView = UITableView(frame: .zero)
    private let customNavigation: PerspectiveCustomNavigation_View
    
    var activityVC: UIActivityViewController?
    var alert: UIAlertController?
    var customAlertVC = PerspectiveCustomAlertViewController()
    
    init(model: PerspectiveGameModesModel, modelScreen: PerspectiveMainModel) {
        self.model = model
        self.modelScreen = modelScreen
        self.customNavigation = PerspectiveCustomNavigation_View(.gameModes, titleString: model.title)
        
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.perspectiveBackActionProceed()
        }
        customNavigation.rightButtonAction = { [weak self] in
            self?.model.perspectiveFilterActionProceed()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            // 2. set its sourceRect here. It's the same as in step 4
            activityVC?.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
        }
    }
    
    
    override func viewDidLoad() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        // super
        super.viewDidLoad()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
        if model.modeItems.isEmpty {
            perspectiveShowLoadSpiner()
        }
        // some comment
        perspectiveSetupView()
        // some comment
        gtavk_setupBindings()
    }
    
    func perspectiveShowLoadSpiner() {
        
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        
        present(alert!, animated: true, completion: nil)
    }
    
    
    private func perspectiveHideSpiner() {
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
    
    private func perspectiveSetupView() {
        view.addSubview(customNavigation)
        customNavigation.perspectiveLayout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 60 : 36.0)
        }
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.perspectiveLayout {
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 25.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 80 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -80 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }
        tableView.registerReusable_Cell(cellType: PerspectiveModesTabViewCellNew.self)
      //  tableView.rowHeight = UITableView.automaticDimension
       // tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 296.0
       // tableView.estimatedRowHeight = UIDevice.current.userInterfaceIdiom == .pad ? 496.0 : 115
       
        // tableView.keyboardDismissMode = .onDrag
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func gtavk_setupBindings() {
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
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if isShowSpinner {
                self.perspectiveShowSpiner()
            } else {
                self.perspectiveHideAlert()
            }
        }.store(in: &subscriptions)
        
        model.showDocumentSaverData.sink { [weak self] localUrl in
            guard let self = self else { return }
            
            print(localUrl)
            self.presentDocumentsPickerForExport(urlPath: localUrl)
            
            
            
        }.store(in: &subscriptions)
        
        model.showAlertSaverData.sink { [weak self] textAlert in
            guard let self = self else { return }
            
            self.gta_showTextAlert(textAlert)
            
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            
        }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.perspectiveHideSpiner()
        }
    }
    
    // MARK: Indicator
    private func perspectiveShowSpiner() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
            customAlertVC.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
            customAlertVC.modalTransitionStyle = .crossDissolve // Плавное появление
            present(customAlertVC, animated: true, completion: nil)
    }

    private func perspectiveHideAlert() {
        alert?.dismiss(animated: false)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        customAlertVC.dismiss(animated: false)
    }
    
    func perspectiveShareFile(at mode: PerspectiveModItem) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if model.perspectiveCheckIsLoadData(mode.modPath) {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(mode.modPath) {
                //
                               if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                 //
                do {
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
                    activityVC = nil
                    activityVC = UIActivityViewController(
                        activityItems: [fileURL],
                        applicationActivities: nil
                    )
                    activityVC?.popoverPresentationController?.sourceView = self.view
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
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
                    //
                                   if 94 + 32 == 57 {
                                print("the world has turned upside down")
                            }
                     //
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
                        //
                                       if 94 + 32 == 57 {
                                    print("the world has turned upside down")
                                }
                         //
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
                    gta_showTextAlert("Error creating sharable URL: \(error)")
                    //                    print("Error creating sharable URL: \(error)")
                }
            }
        } else {
            gta_showTextAlert("To share, you must first download it")
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
        }
    }
    
    
    func gta_showTextAlert(_ text: String) {
        alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        present(alert!, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.perspectiveHideAlert()
            
        }
    }
    
//    func gta_showAlertAge() {
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        alertController.addAction(
//            UIAlertAction(
//                title: L10n.ChatAction.save,
//                style: .default,
//                handler: { [weak self] _ in
//                    self?.model.saveImageToLibrary()
//                }
//            )
//        )
//        alertController.addAction(
//            UIAlertAction(
//                title: L10n.ChatAction.forward,
//                style: .default,
//                handler: { [weak self] _ in
//                    self?.model.forward()
//                }
//            )
//        )
//        alertController.addAction(UIAlertAction(title: L10n.Common.Button.cancel, style: .cancel, handler: nil))
//
//        present(alertController, animated: true, completion: nil)
//        
//    }
    
    
}

extension PerspectiveModesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: PerspectiveModesTabViewCellNew = tableView.dequeueReusableCell(indexPath)
        let mode = model.modeItems[indexPath.row]
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        cell.perspectiveConfigure_cell(mode, isLoaded: model.perspectiveCheckIsLoadData(mode.modPath))
        cell.backgroundColor = .clear
        cell.perspectiveDropShadowStandart()
        
//        cell.downloadAction = { [weak self] in
//            if GTA_NetworkStatusMonitor.shared.isNetworkAvailable {
//                self?.model.gtavk_downloadMode(index: indexPath.row)
//            } else {
//                self?.gta_showTextAlert("No internet")
//            }
//        }
//        
//        cell.shareAction = { [weak self] in
//            self?.gta_shareFile(at: mode)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
      return  model.modeItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // modelScreen.gtavk_selectedItems(index: 4)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let yInfo = PerspectiveModesInfoViewController(model: model)
        yInfo.currentIndex = indexPath.row
       // self.present(yInfo, animated: true, completion: nil)
        self.navigationController?.pushViewController(yInfo, animated: true)

       // print("INFO: \(indexPath.row)")
       // print("INFO: Ячейка №\(indexPath) содержит \(model.modeItems[indexPath.row].title)")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return UIDevice.current.userInterfaceIdiom == .pad ? 230 : 140
    }
    
    
    
    
    
}

extension PerspectiveModesViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension PerspectiveModesViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    func presentDocumentsPickerForExport(urlPath: String) {
        
        if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(urlPath) {
            DispatchQueue.main.async { [weak self] in
                do {
                    let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL], asCopy: true)
                    documentPicker.delegate = self
                    documentPicker.shouldShowFileExtensions = true
                    self?.present(documentPicker, animated: true, completion: nil)
                } catch {
                    self?.gta_showTextAlert("ERROR")
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
