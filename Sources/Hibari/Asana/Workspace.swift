import Himotoki

struct Workspace: Decodable {
    
    let id: Int
    let name: String
    
    static func decode(_ e: Extractor) throws -> Workspace {
        return try Workspace(id: e <| "id", name: e <| "name")
    }
}
