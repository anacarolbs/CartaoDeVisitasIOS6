//
//  LoginViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 26/06/24.
//

import UIKit
import MBProgressHUD
import FirebaseAuth

class LoginViewController: UIViewController {
    
    weak var delegate: OnboardingDelegate?
    private let authManager = AuthManager()
        
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    private enum PageType {
    case login
    case signUp
    }
    
    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    private var currentPageType: PageType = .login {
        didSet {
            setupViewFor(pageType: currentPageType)
//            print(currentPageType)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFor(pageType: .login)
//        view.backgroundColor = .purple
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    private func setupViewFor(pageType: PageType) {
        errorMessage = nil
        passwordConfirmationTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
        
    }
    
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
//        print(sender.selectedSegmentIndex)
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
// outro jeito de escrever a linha acima:
//        if sender.selectedSegmentIndex == 0 {
//            currentPageType = .login
//        } else {
//            currentPageType = .signUp
//        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        guard let email = emailTextField.text,
                !email.isEmpty,
                let password = passwordTextField.text,
                !password.isEmpty,
                let passwordConfirmation = passwordConfirmationTextField.text,
                !passwordConfirmation.isEmpty else {
            showErrorMessageIfNeeded(text: "Confirme as informações inseridas.")
            return
        }
        
        guard password == passwordConfirmation else {
            showErrorMessageIfNeeded(text: "Senha está incorreta")
            return
        }
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        authManager.signUpNewUser(withEmail: email, password: password) { [weak self] (result) in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            switch result {
            case .success:
                this.delegate?.showMainTabBarController()
            case .failure(let error):
                this.showErrorMessageIfNeeded(text: error.localizedDescription)
            }
        }
        
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
//            guard let this = self else { return }
//            MBProgressHUD.hide(for: this.view, animated: true)
//            if let error = error {
//                this.showErrorMessageIfNeeded(text: error.localizedDescription)
////                print(error.localizedDescription)
//            } else if let _ = result?.user.uid {
//                this.delegate?.showMainTabBarController()
//            }
//        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)
        
        guard let email = emailTextField.text, 
                !email.isEmpty,
                let password = passwordTextField.text,
                !password.isEmpty else {
                showErrorMessageIfNeeded(text: "Formato inválido. Por favor, verifique.")
            return
        }
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            if let error = error {
                this.showErrorMessageIfNeeded(text: error.localizedDescription)
            } else if let _ = result?.user.uid {
                this.delegate?.showMainTabBarController()
            }
        }
    }
    
}
