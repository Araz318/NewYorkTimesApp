//
//  TopStoryCell.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit
protocol TopStoryProtocol {
    var timetext: String { get }
    var texttext: String { get }
    var imageUrl: String { get }
    var abstracttext: String { get }
}

class TopStoryCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = 12
    }
    func configure (data:TopStoryProtocol) {
        textLabel.text = data.texttext
        image.loadImage(from: data.imageUrl)
        timeLabel.text = data.timetext
        
    }

}
