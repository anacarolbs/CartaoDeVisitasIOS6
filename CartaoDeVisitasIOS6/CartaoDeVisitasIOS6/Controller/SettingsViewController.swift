//
//  SettingsViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 25/06/24.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    private func setupViews() {
        view.backgroundColor = .white
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        PresenterManager.shared.show(vc: .onboarding)
 //       print("logout")
//        let onboardingViewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.onboardingViewController)
//        
//        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
//            let window = sceneDelegate.window {
//            window.rootViewController = onboardingViewController
//            
//            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
    }
}

