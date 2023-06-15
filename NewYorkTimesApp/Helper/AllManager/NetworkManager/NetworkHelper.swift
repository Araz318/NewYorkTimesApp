


import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.nytimes.com/svc/"
    let apiKey = "lXuOvGUGoLO8jAnHpZWxDY1PbM3ZOW07"
    
    func urlConfig(path: String) -> String {
        baseUrl + path + "?api-key=\(apiKey)"
    }
}
