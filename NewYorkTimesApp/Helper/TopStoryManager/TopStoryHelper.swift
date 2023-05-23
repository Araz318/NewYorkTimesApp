//
//  TopStoryHelper.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
enum TopStoryCategory:String {
    case topstoriesarts = "Arts"
    case topstorieshome = "Home"
    case topstoriesscience = "Science"
    case topstoriesus = "Us"
    case topstoriesworld = "World"
}
enum TopStoryEndpoint: String {
    case topstoriesarts = "topstories/v2/arts.json"
    case topstorieshome = "topstories/v2/home.json"
    case topstoriesscience = "topstories/v2/science.json"
    case topstoriesus = "topstories/v2/us.json"
    case topstoriesworld = "topstories/v2/world.json"
    
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
   
}
