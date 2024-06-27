//
//  LoginViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 26/06/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    weak var delegate: OnboardingDelegate?
    
    private let isSuccessfulLogin = false
    
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
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if isSuccessfulLogin {
            delegate?.showMainTabBarController()
        } else {
            errorMessage = "Sua senha é inválida. Por favor, tente novamente."
        }
        
    }
    
}
