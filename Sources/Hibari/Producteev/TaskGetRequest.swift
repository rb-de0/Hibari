import Foundation
import APIKit
import Himotoki

struct TaskGetRequest: ProducteevRequest {
    
    let projectId: String
    
    var path: String {
        return "/tasks/search"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var queryParameters: [String : Any]? {
        return ["sort": "created_at", "order": "desc"]
    }
    
    var parameters: Any? {
        return ["projects": [projectId]]
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Task] {
        return try decodeArray(object, rootKeyPath: "tasks") as [Task]
    }
}
