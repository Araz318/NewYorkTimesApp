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
    private var coordinator: LoginCoordinator?
    let viewModel = ViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.readDataFromFile()
        configration()
    }
    
    func configration() {
        coordinator = LoginCoordinator(navigationController: navigationController!)
    }
    
    @IBAction func newaccountButton(_ sender: Any) {
        coordinator?.showClickedControllerr()
    }
    
    @IBAction func googleLogin(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            _ = user.profile?.givenName
            _ = user.profile?.familyName
            _ = user.profile?.imageURL(withDimension: 320)
            
            if self.viewModel.userExist(email: emailAddress ?? "") {
                self.emailText.text = emailAddress
            } else {
                self.coordinator?.showClickedController(fullName: fullName, emailAddress: emailAddress)
            }
            
        }
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
                showErrorAlert(message: "Email or password entered is incorrect.")
            }
        }
    }
}
