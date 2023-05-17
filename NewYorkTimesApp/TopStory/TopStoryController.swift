//
//  TopStoryController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit

class TopStoryController: UIViewController {
   
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = TopStoryViewModel()
    private let cellId = "\(TopStoryCell.self)"
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        configStoryModel()
    }
    
    func configStoryModel() {
        viewModel.successCallback = {
            self.collection.reloadData()
        }
        
        viewModel.getTopStory() // Verileri alma işlemi
    }
    
    func configreUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
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
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collection.frame.width, height: collection.frame.height)
            
        }
        
    }

