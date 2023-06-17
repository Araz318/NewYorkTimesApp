//
//  RegisterController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    var emailAddress: String?
    var fullName:     String?
    let viewModel  =  ViewModel.shared
    var isAccepted =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.readDataFromFile()
        configureTextFields()
    }
    func configureTextFields() {
        nameText.text = fullName
        emailText.text = emailAddress
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.backCallBack = {
            self.navigationController?.popViewController(animated: true)
            
            if let loginController = self.navigationController?.viewControllers.first as? LoginController {
                loginController.emailText.text = self.emailText.text
                loginController.passwordText.text = self.passwordText.text
            }
        }
    }
    
    @IBAction func clickOkButton(_ sender: Any) {
        if isAccepted {
            isAccepted = false
            let emptyImage = UIImage()
            okButton.setImage(emptyImage, for: .normal)
        } else {
            let newImage = UIImage(named: "checked (1)")
            okButton.setImage(newImage, for: .normal)
            
            isAccepted = true
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        guard let fullname = nameText.text, !fullname.isEmpty,
              let email = emailText.text, !email.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            showErrorAlert(message: "Please fill in all fields.")
            return
        }
        
        let isValidEmail = email.isValidEmail()
        let isValidPassword = password.isValidPassword()
        
        if !isValidEmail {
            showErrorAlert(message: "Please enter a valid e-mail address.")
            return
        }
        
        if !isValidPassword {
            showErrorAlert(message: "Your password must be a minimum of 6 characters and a maximum of 10 characters.")
            return
        }
        
        let profile = Profile(fullname: fullname, email: email, password: password)
        
        if isAccepted {
            if viewModel.registerUser(profile: profile) {
                viewModel.writeDataToFile()
                
                if let loginController = self.navigationController?.viewControllers.first as? LoginController {
                    loginController.emailText.text = email
                    loginController.passwordText.text = password
                }
                
                viewModel.backCallBack?()
            } else {
                showErrorAlert(message: "This e-mail address is already registered.")
            }
        } else {
            showErrorAlert(message: "Please accept the condition.")
        }
    }
    
}



