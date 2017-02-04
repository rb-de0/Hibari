import Himotoki

struct Note: Decodable {
    let id: String
    let message: String
    
    static func decode(_ e: Extractor) throws -> Note {
        return try Note(id: e <| "id", message: e <| "message")
    }
}
