
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        gtavk_showMainFlow(window)

    }
    
    private func gtavk_showMainFlow(_ window: UIWindow) {
        let flowCoordinator = PerspectiveMainFlowCoordinator()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let controller = flowCoordinator.perspectiveCreateFlow()
        controller.modalPresentationStyle = .fullScreen
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let navigation = UINavigationController(rootViewController: controller)
        navigation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            PerspectiveThirdPartyServicesManager.shared.perspectiveMake_ATT()
        }
    }
    
}
