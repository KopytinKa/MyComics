//
//  AppDelegate.swift
//  MyComics
//
//  Created by Кирилл Копытин on 26.06.2023.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: RootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        FirebaseApp.configure()
        
        coordinator = RootCoordinator()
        coordinator?.start(in: window)
        
        return true
    }

}
