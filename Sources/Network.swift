import Himotoki

final class Network: Decodable {
    let id: String
    let title: String
    var projects = [Project]()
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    static func decode(_ e: Extractor) throws -> Network {
        return try Network(id: e <| "id", title: e <| "title")
    }
}
