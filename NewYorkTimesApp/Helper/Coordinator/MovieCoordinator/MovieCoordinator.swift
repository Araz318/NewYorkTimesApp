//
//  MovieCoordinator.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 13.06.23.
//

import Foundation
import UIKit
class MovieCoordinator: CoreCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func clickedController(indexPath: IndexPath, viewModel: MovieViewModel) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MovieDetailController") as! MovieDetailController
        controller.movie = viewModel.topmovie[indexPath.item]
        navigationController.show(controller, sender: nil)
    }
}
