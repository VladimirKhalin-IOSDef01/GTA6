
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
//    /*
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        actualShowMainFlow(window)

    }
    
    private func actualShowMainFlow(_ window: UIWindow) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        let flowCoordinator = ActualProjectMainFlowCoordinator()
      
        let controller = flowCoordinator.actualCreateFlow()
        controller.modalPresentationStyle = .fullScreen
      
        let navigation = UINavigationController(rootViewController: controller)
        navigation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

        }
    }
}
