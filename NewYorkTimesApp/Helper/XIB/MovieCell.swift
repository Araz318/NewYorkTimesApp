//
//  MovieCell.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 27.05.23.
//

import UIKit
protocol MovieProtocol {
    var timetext:        String   { get }
    var ratingtext:      String   { get }
    var imageUrl:        String   { get }
    var titletext:       String   { get }
    var bylinetext:      String   { get }
    var sumaryshorttext: String   { get }
}


class MovieCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = 12
    }
    func configure (data:MovieProtocol) {
        label.text = data.titletext
        image.loadImage(from: data.imageUrl)
    }
    
}
