import Himotoki

final class Project: Decodable {
    let id: String
    let title: String
    var tasks = [Task]()
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    static func decode(_ e: Extractor) throws -> Project {
        return try Project(id: e <| "id", title: e <| "title")
    }
}
