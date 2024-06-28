//
//  HomeViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 27/06/24.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.home
    }
    
    private func setupViews() {
        if let email = Auth.auth().currentUser?.email {
            emailLabel.text = email
        } else {
            emailLabel.text = "Algo está terrivelmente errado!"
        }
    }
}
