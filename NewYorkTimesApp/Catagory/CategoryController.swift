//
//  CatagoryController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 23.05.23.
//

import UIKit
import PanModal

protocol CategoryProtocol {
    func getCategory(category: TopStoryCategory)
}

class CategoryController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    let viewModel = CategoryViewModel()
    
    var delegate: CategoryProtocol?
    
    var didCategorySelected: ((TopStoryCategory)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
extension CategoryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        cell.configure(data: viewModel.items[indexPath.item].rawValue)
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didCategorySelected?(viewModel.items[indexPath.item])
        dismiss(animated: true)
    }
}

extension CategoryController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return categoryTableView
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(220)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
}

