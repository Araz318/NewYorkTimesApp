//
//  MovieController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 27.05.23.
//

import UIKit

class MovieController: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    var movieModel        =   MovieViewModel()
    private let cellId    = "\(MovieCell.self)"
    var coordinator: MovieCoordinator?
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        configmovieModel()
        
    }
    
    func configmovieModel() {
        movieModel.getMovie()
        movieModel.getMovieSearch(text: "")
        movieModel.successCallback = {
            self.refreshController.endRefreshing()
            self.collection.reloadData()
        }
    }
    
    func configreUI() {
        coordinator = MovieCoordinator(navigationController: navigationController!)
        title = "Movie"
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl               = refreshController
        collection.showsVerticalScrollIndicator = false
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    @objc func pullToRefresh() {
        movieModel.getMovie()
        collection.reloadData()
        movieModel.reset()
    }
    
    @IBAction func movieSearchTextField(_ sender: Any) {
        if !(searchText.text?.isEmpty ?? false) {
            movieModel.getMovieSearch(text: searchText.text ?? "")
        }
    }
    
}

extension MovieController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel.topmovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        cell.configure(data: movieModel.topmovie[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let coordinator = coordinator {
            coordinator.clickedController(indexPath: indexPath, viewModel: movieModel)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
        
    }
    
}

extension MovieController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? false {
            movieModel.resetDatass()
            collection.reloadData()
        }
        textField.resignFirstResponder()
        return true
    }
}
