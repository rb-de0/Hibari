import Foundation
import APIKit
import Himotoki

struct TaskCreateRequest: AsanaRequest {
    
    let accessToken: String
    let dueOn: String?
    let name: String
    let projectId: Int?
    let parentId: Int?
    let completed: Bool
    
    var path: String {
        return "/tasks"
    }
    
    var parameters: Any? {
        let projects = projectId != nil ? [projectId!] : nil
        let params: [String: Any?] = ["due_on": dueOn, "name": name, "projects": projects, "parent": parentId, "completed": completed]
        let adjusted = params.filterPairs {(_, value) in value != nil}.mapPairs {(key, value) in (key, value!)}
        return ["data": adjusted]
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AsanaObjectStatus {
        return try decodeValue(object, rootKeyPath: "data") as AsanaObjectStatus
    }
}
