//
//  TableViewCell.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 23.05.23.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    
    func configure(data: String) {
       categoryLabel.text = data
    }
}
