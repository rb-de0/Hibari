import Foundation
import APIKit
import Himotoki

struct ProjectGetRequest: ProducteevRequest {
    
    let accessToken: String
    let id: String
    
    var path: String {
        return "/networks/\(id)/projects"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Project] {
        return try decodeArray(object, rootKeyPath: "projects") as [Project]
        
    }
}
