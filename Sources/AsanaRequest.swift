import Foundation
import APIKit

protocol AsanaRequest: Request {
    var accessToken: String { get }
}

extension AsanaRequest {
    
    var baseURL: URL {
        return URL(string: "https://app.asana.com/api/1.0")!
    }
    
    var headerFields: [String : String] {
        return [
            "Authorization": "Bearer \(accessToken)"
        ]
    }
}
