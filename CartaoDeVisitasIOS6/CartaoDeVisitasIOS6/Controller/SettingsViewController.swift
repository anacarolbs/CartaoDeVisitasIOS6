//
//  SettingsViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 25/06/24.
//

import UIKit
import MBProgressHUD
import FirebaseAuth

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.settings
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            do {
                try Auth.auth().signOut()
                MBProgressHUD.hide(for: self.view, animated: true)
                PresenterManager.shared.show(vc: .onboarding)
            } catch(let error) {
                print(error.localizedDescription)
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
}

