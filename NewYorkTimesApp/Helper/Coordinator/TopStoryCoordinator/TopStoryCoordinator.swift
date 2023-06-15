//
//  TopStoryCoordinator.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 23.05.23.
//

import Foundation
import UIKit
import PanModal

class TopStoryCoordinator: CoreCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchController") as! SearchController
        navigationController.show(controller, sender: nil)
    }
    
    func clickedController(indexPath: IndexPath, viewModel: TopStoryViewModel) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailController") as! DetailController
        
        controller.story = viewModel.topstories[indexPath.item]
        navigationController.show(controller, sender: nil)
        
    }
    
    func showClickedCategory(vc: TopStoryController) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CategoryController") as! CategoryController
        controller.delegate = vc
        navigationController.presentPanModal(controller, sourceView: nil)
    }
    
    func showClickedCategory2(complete: @escaping((TopStoryCategory)->())) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CategoryController") as! CategoryController
        controller.didCategorySelected = { category in
            complete(category)
        }
        navigationController.presentPanModal(controller, sourceView: nil)
    }
}
