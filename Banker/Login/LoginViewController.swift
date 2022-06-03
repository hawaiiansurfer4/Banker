//
//  ViewController.swift
//  Banker
//
//  Created by Sean Murphy on 6/1/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLablel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemRed
        titleLabel.font = .systemFont(ofSize: CGFloat(40))
        titleLabel.numberOfLines = 1
        titleLabel.text = "Banker"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .systemRed
        subtitleLabel.font = .systemFont(ofSize: CGFloat(30))
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLablel)
        
        // Title Label
        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
        ])
        
        // Subtitle Label
        NSLayoutConstraint.activate([
//            subtitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1)
        ])

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
            return
        }
        
        if username == "K" && password == "A" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
            return
        } else {
            configureView(withMessage: "Inccorect username / password")
            return
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLablel.isHidden = false
        errorMessageLablel.text = message
    }
}

