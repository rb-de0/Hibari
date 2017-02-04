import Foundation
import APIKit
import Himotoki

struct StoryCreateRequest: AsanaRequest {
    
    let accessToken: String
    let text: String
    let taskId: Int
    
    var path: String {
        return "/tasks/\(taskId)/stories"
    }
    
    var parameters: Any? {
        return ["data": ["text": text]]
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AsanaObjectStatus {
        return try decodeValue(object, rootKeyPath: "data") as AsanaObjectStatus
    }
}
