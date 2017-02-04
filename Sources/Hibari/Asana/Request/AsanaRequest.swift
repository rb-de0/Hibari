import Foundation
import APIKit

struct AsanaConfig {
    static var accessToken = ""
}

protocol AsanaRequest: Request {}

extension AsanaRequest {
    
    var baseURL: URL {
        return URL(string: "https://app.asana.com/api/1.0")!
    }
    
    var headerFields: [String : String] {
        return [
            "Authorization": "Bearer \(AsanaConfig.accessToken)"
        ]
    }
}
