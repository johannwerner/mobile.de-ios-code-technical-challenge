//
//  AppDelegate.swift
//  mobile
//
//  Created by Johann Werner on 19.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        startApp()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

private extension AppDelegate {
    func startApp() {
        let startNavigationController = createNavigationController()
        showIntroduction(navigationController: startNavigationController)
    }
    
    func createNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
        self.window = window
        return navigationController
    }
    
    func showIntroduction(navigationController: UINavigationController) {
        let interactor = IntroductionModuleInteractorApi()
        let configurator = IntroductionModuleConfigurator(introductionModuleInteractor: interactor)
        
        let coordinator = IntroductionModuleCoordinator(
            navigationController: navigationController,
            configurator: configurator
        )
        coordinator.showIntroduction(animated: true)
    }
    
    func showMainImage(navigationController: UINavigationController) {
        let configurator = MainImageConfigurator(mainImageInteractor: MainImageInteractorApi())
        let coordinator = MainImageCoordinator(navigationController: navigationController, configurator: configurator)
        let imageModel = MainImageModel.ImageModel(bigImageUrl: "https://www.bonecollector.com/wp-content/uploads/2017/02/shed-hunting-dog-training-tips_pic4.jpg")
        let mainImageModel = MainImageModel(selectedIndex: 0, models: [imageModel])
        coordinator.showLargeImage(model: mainImageModel, animated: true)
    }

}

