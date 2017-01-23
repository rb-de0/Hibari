import Foundation
import APIKit

protocol ProducteevRequest: Request {
    var accessToken: String { get }
}

extension ProducteevRequest {
    
    var baseURL: URL {
        return URL(string: "https://www.producteev.com/api")!
    }
    
    var headerFields: [String : String] {
        return ["Authorization": "Bearer \(accessToken)"]
    }
}

struct TestRequest: Request {
    
    var baseURL: URL {
        return URL(string: "https://www.google.com")!
    }
    
    var path: String {
        return "/"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> String {
        return object as! String
    }
}
