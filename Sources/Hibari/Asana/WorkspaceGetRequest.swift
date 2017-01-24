import Foundation
import APIKit
import Himotoki

struct WorkspaceGetRequest: AsanaRequest {
    
    let accessToken: String
    
    var path: String {
        return "/workspaces"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Workspace] {
        return try decodeArray(object, rootKeyPath: "data") as [Workspace]
    }
}
