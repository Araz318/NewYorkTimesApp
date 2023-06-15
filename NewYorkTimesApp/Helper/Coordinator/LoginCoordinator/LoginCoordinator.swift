//
//  LoginCoordinator.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 13.06.23.
//

import Foundation
import UIKit
class LoginCoordinator: CoreCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
        navigationController.show(controller, sender: nil)
    }
}

