//
//  AppDelegate.swift
//  Banker
//
//  Created by Sean Murphy on 6/1/22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    let accountSummaryViewController = AccountSummaryViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboardingContainerViewController.delegateOn = self
        
        let vc = mainViewController
        vc.setStatusBar()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        
        window?.rootViewController = vc
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewCOntroller(mainViewController)
        } else {
            setRootViewCOntroller(onboardingContainerViewController)
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewCOntroller(mainViewController)
    }
}

extension AppDelegate {
    func setRootViewCOntroller(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogut() {
        setRootViewCOntroller(loginViewController)
    }
}
