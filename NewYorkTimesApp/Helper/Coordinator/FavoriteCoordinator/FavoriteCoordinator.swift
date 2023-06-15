//
//  FavoriteCoordinator.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 13.06.23.
//

import Foundation

import UIKit
class FavoriteCoordinator: CoreCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func clickedController(indexPath: IndexPath, viewModel: FavoriteViewModel) {
        if indexPath.item < viewModel.items.count {
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailController") as! DetailController
            controller.story = viewModel.items[indexPath.item]
            navigationController.show(controller, sender: nil)
        }
    }
}
