import Himotoki

struct AsanaObjectStatus: Decodable {
    let id: Int
    
    static func decode(_ e: Extractor) throws -> AsanaObjectStatus {
        return try AsanaObjectStatus(id: e <| "id")
    }
}
