//
//  LoadingViewController.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 25/06/24.
//

import UIKit
//import FirebaseAuth


class LoadingViewController: UIViewController {
    
    private let authManager = AuthManager()
    
//    private var isUserLoggedIn: Bool {
//        return Auth.auth().currentUser != nil
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationInSeconds: 2.0) {
            self.showInitialView()
        }
    }
    
//    private func setupViews() {
//        view.backgroundColor = .orange
//    }
    
    private func showInitialView() {
        
        //if the user is logged in => main tab controller
        //if the user is not logged in => show the onboarding controller
        
        if authManager.isUserLoggedIn() {
            PresenterManager.shared.show(vc: .mainTabBarController)
//            let mainTabBarController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.mainTabBarController)
//            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,  
//                let window = sceneDelegate.window {
//                window.rootViewController = mainTabBarController
//            }
        } else {
            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
        }
    }
}
