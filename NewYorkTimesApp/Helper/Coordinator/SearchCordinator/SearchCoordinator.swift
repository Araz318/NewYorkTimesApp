//
//  SearchCoordinator.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 13.06.23.
//


import Foundation
import UIKit
class SearchCoordinator: CoreCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func clickedController(indexPath: IndexPath, viewModel: SearchViewModel) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchDetailController") as! SearchDetailController
        controller.search = viewModel.search[indexPath.item]
        navigationController.show(controller, sender: nil)
        
    }
}
