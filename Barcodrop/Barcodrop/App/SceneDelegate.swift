//
//  SceneDelegate.swift
//  Barcodrop
//
//  Created by SG on 2022/01/16.
//

import UIKit
import CBFlashyTabBarController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house")!, tag: 0)
        
        let categoryVC = CategoryViewController()
        categoryVC.tabBarItem = UITabBarItem(title: "카테고리", image: UIImage(systemName: "circle.grid.3x3.fill")!, tag: 0)
        
        let statusVC = SettingViewController()
        statusVC.tabBarItem = UITabBarItem(title: "상태", image:  UIImage(systemName: "chart.bar.doc.horizontal.fill")!, tag: 0)
        
        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(title: "설정", image:  UIImage(systemName: "gearshape.fill")!, tag: 0)
        
        let tabBarController = CBFlashyTabBarController()
        tabBarController.viewControllers = [homeVC, categoryVC, statusVC, settingVC]
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainViewController = tabBarController
        self.window?.rootViewController  = mainViewController
        self.window?.makeKeyAndVisible()
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

