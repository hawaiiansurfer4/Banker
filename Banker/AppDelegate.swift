//
//  AppDelegate.swift
//  Banker
//
//  Created by Sean Murphy on 6/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasOnboarded = false

    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboardingContainerViewController.delegateOn = self
        dummyViewController.logoutDelegate = self

        window?.rootViewController = loginViewController
//        window?.rootViewController = onboardingContainerViewController
//        window?.rootViewController = OnboardingViewController(imageName: "world", titleText: "peace to the world")

        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if hasOnboarded {
            setRootViewCOntroller(dummyViewController)
        } else {
            setRootViewCOntroller(onboardingContainerViewController)
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        hasOnboarded = true
        setRootViewCOntroller(dummyViewController)
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
