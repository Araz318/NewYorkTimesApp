//
//  TopStoryHelper.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
enum TopStoryEndpoint: String {
    case topstories = "topstories/v2/home.json"
    
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
   
}
