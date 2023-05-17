//
//  UIImageView+Extension.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 16.05.23.
//

import Foundation
import SDWebImage

extension UIImageView {

        func loadImage(from imageUrl: String) {
            if let url = URL(string: imageUrl) {
                self.sd_setImage(with: url)
            }
        }
    }
let imageUrl = "https://example.com/image.jpg"
   // imageUrl.loadImage(from: imageUrl  )


