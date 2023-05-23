//
//  TopStoryController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit
import PanModal

class TopStoryController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = TopStoryViewModel()
    private let cellId = "\(TopStoryCell.self)"
    
    let refreshController = UIRefreshControl()
    private var coordinator: TopStoryCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configreUI()
        configStoryModel()
    }
    
    func configreUI() {
        title = "Top Stories"
        coordinator = TopStoryCoordinator(navigationController: navigationController ?? UINavigationController())
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshController
        collection.showsVerticalScrollIndicator = false
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configStoryModel() {
        viewModel.successCallback = {
            self.refreshController.endRefreshing()
            self.collection.reloadData()
        }
        viewModel.getTopStory(category: .topstorieshome)
    }
    
    @IBAction func topListButton(_ sender: Any) {
        coordinator?.showClickedCategory2(complete: { category in
            self.viewModel.getTopStory(category: category)
        })
    }
    
    @objc func pullToRefresh() {
        viewModel.getTopStory(category: .topstorieshome)
        collection.reloadData()
        viewModel.reset()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure to log out?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = scene.delegate as? SceneDelegate {
                UserDefaults.standard.set(false, forKey: "loggedIn")
                sceneDelegate.setLoginRootController(windowScene: scene)
            }
        }
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    func rootController() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            UserDefaults.standard.set(false, forKey: "homNav2")
            sceneDelegate.setRootController(windowScene: scene)
        }
    }
}

extension TopStoryController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.topstories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopStoryCell
        cell.configure(data: viewModel.topstories[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailController") as! DetailController
        
        controller.story = viewModel.topstories[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: 100)
    }
}
extension TopStoryController: CategoryProtocol {
    func getCategory(category: TopStoryCategory) {
        viewModel.getTopStory(category: category)
    }
}
