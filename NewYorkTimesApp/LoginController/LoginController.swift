//
//  LoginController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 17.05.23.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.readDataFromFile()
    }
    
    
    @IBAction func newaccountButton(_ sender: Any) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
        
        navigationController?.show(controller, sender: nil)

    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailText.text,
           let password = passwordText.text,
           !email.isEmpty, !password.isEmpty
        {
            viewModel.readDataFromFile()
                
            if viewModel.profiles.contains(where: { $0.email == email && $0.password == password }) {
                let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(TopStoryController.self)") as! TopStoryController
                navigationController?.show(controller, sender: nil)
            }
            
            
        } else {
            print("Sehv melumat daxil etdiniz, tekrar yoxlayin")
        }
        
    }
    
    
}
