import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let store = World.default.store()

        let counterViewModel =
            CounterViewModel
                .viewModel(store: store)
                .asObservableViewModel(initialState: .empty)

        let counterView = CounterView(viewModel: counterViewModel)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: counterView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
