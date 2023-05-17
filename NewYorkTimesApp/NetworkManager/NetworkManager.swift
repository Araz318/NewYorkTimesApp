//
//  NetworkManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
import Alamofire
class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(model: T.Type,
                             url: String,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             encoding: ParameterEncoding = URLEncoding.default,
                             headers: HTTPHeaders? = nil,
                             complete: @escaping((T?, String?)->())) {
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers).responseData { responseData in
            do {
                let item = try JSONDecoder().decode(T.self, from: responseData.data ?? Data())
                complete(item, nil)
            } catch {
                complete(nil, error.localizedDescription)
            }
        }
    }
}
