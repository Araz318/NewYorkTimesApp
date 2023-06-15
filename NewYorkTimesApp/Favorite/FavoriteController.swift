//
//  FavoriteController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 03.06.23.
//

import UIKit

class FavoriteController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    private let cellId = "\(FavoriteCell.self)"
    let refreshController = UIRefreshControl()
    private let viewModel = FavoriteViewModel()
    var coordinator: FavoriteCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configreUI()
        viewModel.getItems()
    }
    
    func configreUI() {
        coordinator = FavoriteCoordinator(navigationController: navigationController!)
        title = "Favorite"
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshController
        collection.showsVerticalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
    }
    
    @objc func pullToRefresh() {
        DispatchQueue.main.asyncAfter(deadline:.now() + 1){
            self.refreshController.endRefreshing()
            self.viewModel.getItems()
            self.collection.reloadData()
        }
    }
}

extension FavoriteController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoriteCell
        if indexPath.item < viewModel.items.count {
            cell.label.text = viewModel.items[indexPath.item].title
            cell.story = viewModel.items[indexPath.item]
            cell.loadImage()
        }
        cell.favoriteNewsCallBack = { [weak self] in
            guard let self = self else { return }
            self.viewModel.deleteItem(index: indexPath.item)
            self.viewModel.getItems()
            self.collection.reloadData()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.clickedController(indexPath: indexPath, viewModel: viewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: 300)
    }
}
