import Foundation
import APIKit
import Result

struct HTTPClient {
    
    static func send<T: Request>(with request: T) -> T.Response {
        
        var response: T.Response?
        let semaphore = DispatchSemaphore(value: 0)
        
        Session.send(request, callbackQueue: .dispatchQueue(.global())) { result in
            
            switch result {
            case .success(let res):
                response = res
            case .failure(let error):
                print(error)
                exit(1)
            }
            
            semaphore.signal()
        }
        
        semaphore.wait()
        return response!
    }
}
