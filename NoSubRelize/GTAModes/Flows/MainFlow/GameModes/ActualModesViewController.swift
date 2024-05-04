
import UIKit
import Combine

class ActualModesViewController: ActualNiblessViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    private let model: ActualGameModesModel
    private let modelScreen: ActualMainModel
    private let tableView = UITableView(frame: .zero)
    private let customNavigation: ActualCustomNavigation_View
    
    var activityVC: UIActivityViewController?
    var alert: UIAlertController?
   
    var customAlertVC = ActualBlurBack()
    var fakeLoader = ActualFakeLoader()
    
    init(model: ActualGameModesModel, modelScreen: ActualMainModel) {
        self.model = model
        self.modelScreen = modelScreen
        self.customNavigation = ActualCustomNavigation_View(.gameModes, titleString: model.title)
        
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
   
        super.viewDidLoad()
     
        
        tableView.showsVerticalScrollIndicator = false
      
        
        if model.modeItems.isEmpty {
            actualShowLoadSpiner()
        }
        // some comment
        actualSetupView()
        // some comment
        actualSetupBindings()
    }
    
    func actualShowLoadSpiner() {
        fakeLoader.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
        fakeLoader.modalTransitionStyle = .crossDissolve // Плавное появление
        fakeLoader.setupFakeLoaderView(duration: 17)
        present(fakeLoader, animated: true, completion: nil)
    }
    
    
    private func actualHideSpiner() {
     
        alert?.dismiss(animated: false)
        fakeLoader.dismiss(animated: false)
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
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 25.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 110 : 0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -110 : 0)
            $0.bottom.equal(to: view.bottomAnchor)
        }
        tableView.registerReusable_Cell(cellType: ActualModesTabViewCellNew.self)
        // tableView.keyboardDismissMode = .onDrag
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
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
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            if isShowSpinner {
                self.actualShowSpiner()
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
            
            self.actualShowTextAlert(textAlert)
            
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            
        }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.actualHideSpiner()
        }
    }
    
    // MARK: Indicator
    private func actualShowSpiner() {
           customAlertVC.modalPresentationStyle = .overCurrentContext // Для прозрачного фона
           customAlertVC.modalTransitionStyle = .crossDissolve // Плавное появление
           present(customAlertVC, animated: true, completion: nil)
    }

    private func perspectiveHideAlert() {
        alert?.dismiss(animated: false)
        customAlertVC.dismiss(animated: false)
    }
    
    func perspectiveShareFile(at mode: ActualModItem) {
        
        if model.actualCheckIsLoadData(mode.modPath) {
          
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
                    actualShowTextAlert("Error creating sharable URL: \(error)")
                    //                    print("Error creating sharable URL: \(error)")
                }
            }
        } else {
            actualShowTextAlert("To share, you must first download it")
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
        }
    }
    
    
    func actualShowTextAlert(_ text: String) {
        alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        present(alert!, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.perspectiveHideAlert()
            
        }
    }
}

extension ActualModesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let cell: ActualModesTabViewCellNew = tableView.dequeueReusableCell(indexPath)
        let mode = model.modeItems[indexPath.row]
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        cell.actualConfigure_cell(mode, isLoaded: model.actualCheckIsLoadData(mode.modPath))
        cell.backgroundColor = .clear
        cell.perspectiveDropShadowStandart()
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
        let yInfo = ActualModesInfoViewController(model: model)
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
        return UIDevice.current.userInterfaceIdiom == .pad ? 320 : 238
    }
    
    
    
    
    
}

extension ActualModesViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension ActualModesViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
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
