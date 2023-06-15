//
//  FavoriteCell.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 04.06.23.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    var favoriteNewsCallBack: (()->())?
    var story: TopStoryResult?
    
    
    @IBAction func trashButton(_ sender: Any) {
        favoriteNewsCallBack?()
        
    }
    func loadImage() {
        image.loadImage(from: story?.imageUrl ?? "")
    }
    
  
}

