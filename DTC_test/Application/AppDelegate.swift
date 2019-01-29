//
//  AppDelegate.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    private lazy var applicationCoordinator: Coordinatable = self.makeCoordinator()

    private func makeCoordinator() -> Coordinatable {
        return ApplicationCoordinator(router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = Dependencies.sharedDependencies
        applicationCoordinator.start()
        return true
    }
}

