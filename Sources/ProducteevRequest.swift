import Foundation
import APIKit

protocol ProducteevRequest: Request {
    var accessToken: String { get }
}

extension ProducteevRequest {
    
    var baseURL: URL {
        return URL(string: "https://www.producteev.com/api")!
    }
    
    var headerFields: [String : String] {
        return [
            "Authorization": "Bearer \(accessToken)"
        ]
    }
}
