import Himotoki

struct Network: Decodable {
    let id: String
    let title: String
    
    static func decode(_ e: Extractor) throws -> Network {
        return try Network(id: e <| "id", title: e <| "title")
    }
}
