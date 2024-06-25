//
//  LoadingViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 25/06/24.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .orange
    }
    
    private func showInitialView() {
        
        //if the user is logged in => main tab controller
        //if the user is not logged in => show the onboarding controller
        
        if isUserLoggedIn {
            
        } else {
            
        }
    }
}
