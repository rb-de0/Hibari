import Foundation
import APIKit

struct ProducteevConfig {
     static var accessToken = ""
}

protocol ProducteevRequest: Request {}

extension ProducteevRequest {
    
    var baseURL: URL {
        return URL(string: "https://www.producteev.com/api")!
    }
    
    var headerFields: [String : String] {
        return [
            "Authorization": "Bearer \(ProducteevConfig.accessToken)"
        ]
    }
}
