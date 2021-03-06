//
//  AppDelegate.swift
//  WebantGallery
//
//  Created by IVAN KHRAMOV on 11.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let service = APIService()
            
            window = UIWindow()
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let newNavVC = storyboard.instantiateViewController(identifier: "newNavVC") as UINavigationController
            let popularNavVC = storyboard.instantiateViewController(identifier: "popularNavVC") as UINavigationController
            
            GalleryConfigurator.createViewController(navigationController: newNavVC, newOrPopularChooser: service.fetchNewPhotos, title: "New")
            
            GalleryConfigurator.createViewController(navigationController: popularNavVC, newOrPopularChooser: service.fetchPopularPhotos, title: "Popular")
            
                        
            let controller = storyboard.instantiateViewController(identifier: "InitialViewController") as! UITabBarController
            
            controller.viewControllers = [newNavVC, popularNavVC]
            
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
            
            return true
        }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

