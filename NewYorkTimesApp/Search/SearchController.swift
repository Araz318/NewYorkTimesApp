//
//  SearchController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 20.05.23.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    var searchModel = SearchViewModel()
    private let cellId = "\(SearchCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        configsearchModel()
        title = "Search"
    }
    func configsearchModel() {
        searchModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    func configreUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    
    @IBAction func searchTextFieldAction(_ sender: Any) {
        if !(searchTextField.text?.isEmpty ?? false) {
            searchModel.getSearch(text: searchTextField.text ?? "")
        }
    }
}
extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchModel.search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        cell.configure(data: searchModel.search[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchDetailController") as! SearchDetailController
        controller.search = searchModel.search[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width , height: 300)
    }
}

extension SearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? false {
            searchModel.resetDatas()
            collection.reloadData()
        }
        textField.resignFirstResponder()
        return true
    }
}


