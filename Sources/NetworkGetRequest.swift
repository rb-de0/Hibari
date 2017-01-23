import Foundation
import APIKit
import Himotoki

struct NetworkGetRequest: ProducteevRequest {
    
    let accessToken: String
    
    var path: String {
        return "/networks"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Network] {
        return try decodeArray(object, rootKeyPath: "networks") as [Network]
        
    }
}
