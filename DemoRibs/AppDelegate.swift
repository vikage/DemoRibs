//
//  AppDelegate.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var rootRouter: RootRouting!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        
        let rootBuilder = RootBuilder(dependency: AppComponent(window: self.window!))
        self.rootRouter = rootBuilder.build()
        self.rootRouter.interactable.activate()
        self.rootRouter.load()
        return true
    }
}

