//
//  File.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
struct Profile: Decodable, Encodable { 
    let fullname: String
    let email: String
    let password: String
}
