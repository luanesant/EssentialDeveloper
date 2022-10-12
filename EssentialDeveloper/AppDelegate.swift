//
//  AppDelegate.swift
//  EssentialDeveloper
//
//  Created by Luane dos Santos Lopes on 01/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        let vc = FeedViewController(loader: RemoteFeedLoader())
        //         let vc = FeedViewController(loader: LocalFeedLoader())
        //         let vc = FeedViewController()
        //         vc.loader = RemoteWithLocalFallbackFeedLoader(remote: RemoteFeedLoader(),
        //                                                        local: LocalFeedLoader())
        let mainController = vc
        navigationController.viewControllers = [mainController]
        
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

