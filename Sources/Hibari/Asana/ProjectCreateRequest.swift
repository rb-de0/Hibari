import Foundation
import APIKit
import Himotoki

struct ProjectCreateRequest: AsanaRequest {
    
    let accessToken: String
    let name: String
    let workspace: Int
    
    var path: String {
        return "/projects"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: Any? {
        return ["data": ["name": name, "workspace": workspace, "public": false]]
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        return object
    }
}
