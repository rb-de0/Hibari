import Himotoki

struct Task: Decodable {
    let id: String
    let title: String
    
    static func decode(_ e: Extractor) throws -> Task {
        return try Task(id: e <| "id", title: e <| "title")
    }
}
