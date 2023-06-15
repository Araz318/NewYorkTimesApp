//
//  LoginController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 17.05.23.
//

import UIKit
import GoogleSignIn

class LoginController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    // let viewModel = LoginViewModel()
    private var coordinator: LoginCoordinator?
    let viewModel = ViewModel.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.readDataFromFile()
        coordinator = LoginCoordinator(navigationController: navigationController!)
    }
    
    @IBAction func newaccountButton(_ sender: Any) {
        coordinator?.showClickedController()
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailText.text,
           let password = passwordText.text,
           !email.isEmpty, !password.isEmpty
        {
            if viewModel.validateLogin(email: email, password: password) {
                UserDefaults.standard.set(true, forKey: "loggedIn")
                
                if let profile = viewModel.getProfile(email: email) {
                    UserDefaults.standard.set(profile.fullname, forKey: "loggedInName")
                    UserDefaults.standard.set(profile.email, forKey: "loggedInEmail")
                }
                
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = scene.delegate as? SceneDelegate {
                    sceneDelegate.setRootController(windowScene: scene)
                }
            }
            else {
                showErrorAlert(message: "Girilen e-posta veya şifre yanlış.")
            }
        }
    }
}
