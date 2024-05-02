//
//  AppDelegate.swift
//  FirstGamesDeepLinkTest
//
//  Created by Sparsh on 02/05/24.
//

import UIKit
import OtplessSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if Otpless.sharedInstance.isOtplessDeeplink(url: url) {
            Otpless.sharedInstance.processOtplessDeeplink(url: url)
            return true
        }
        
        return true
    }


}

