import Foundation
import APIKit
import Himotoki

struct NoteGetRequest: ProducteevRequest {
    
    let accessToken: String
    let taskId: String
    
    var path: String {
        return "/tasks/\(taskId)/notes"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Note] {
        return try decodeArray(object, rootKeyPath: "notes") as [Note]
    }
}
