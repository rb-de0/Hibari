import Himotoki

struct Project: Decodable {
    let id: String
    let title: String
    
    static func decode(_ e: Extractor) throws -> Project {
        return try Project(id: e <| "id", title: e <| "title")
    }
}
