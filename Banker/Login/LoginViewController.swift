//
//  ViewController.swift
//  Banker
//
//  Created by Sean Murphy on 6/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLablel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLablel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLablel.textAlignment = .center
        errorMessageLablel.textColor = .systemRed
        errorMessageLablel.numberOfLines = 0
        errorMessageLablel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLablel)
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        // ErrorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorMessageLablel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLablel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLablel.trailingAnchor, multiplier: 1)
        ])

    }
}

//MARK: - Actions

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLablel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username/Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLablel.isHidden = false
        errorMessageLablel.text = message
    }
}

