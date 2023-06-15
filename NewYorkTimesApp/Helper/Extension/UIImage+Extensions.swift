//
//  UIImage+Extensions.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.06.23.
//

import UIKit
import Foundation

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: targetSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
