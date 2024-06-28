//
//  SettingsViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 25/06/24.
//

import UIKit
import MBProgressHUD
//import FirebaseAuth
import Loaf

class SettingsViewController: UIViewController {
    
    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
//        delay(durationInSeconds: 3.0) {
//            Loaf("Você saiu com sucesso. Volte sempre!", state: .error, location: .top, sender: self).show()
//       }
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.settings
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) { [weak self] in
            guard let this = self else { return }
            let result = this.authManager.logoutUser()
            switch result {
            case .success:
                PresenterManager.shared.show(vc: .onboarding)
            case .failure(let error):
                Loaf(error.localizedDescription, state: .error, location: .top, sender: this).show()
                print(error.localizedDescription)
            }
            MBProgressHUD.hide(for: this.view, animated: true)
        }
    }
}

