import Himotoki

enum TaskStatus {
    case completed
    case active
    case inProgress
    case pause
    
    init(status: Int, progressionStatus: Int?) {
        
        switch (status, progressionStatus) {
        case (0, _):
            self = .completed
        case (1, nil):
            self = .active
        case (1, let pStatus) where pStatus == 1:
            self = .inProgress
        case (1, let pStatus) where pStatus == 2:
            self = .pause
        default:
            self = .active
        }
    }
    
    var isComleted: Bool {
        return self == .completed
    }
}

final class Task: Decodable {
    let id: String
    let title: String
    let deadline: String?
    let status: TaskStatus
    let noteCount: Int?
    let subTasks: [Task]?
    var notes = [Note]()
    
    init(id: String, title: String, deadline: String?, status: TaskStatus, noteCount: Int?, subTasks: [Task]?) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.status = status
        self.noteCount = noteCount
        self.subTasks = subTasks
    }
    
    static func decode(_ e: Extractor) throws -> Task {
        return try Task(
            id: e <| "id",
            title: e <| "title",
            deadline: e <|? "deadline",
            status: TaskStatus(status: e <| "status", progressionStatus: e <|? "progression_status"),
            noteCount: e <|? "notes_count",
            subTasks: e <||? "subtasks"
        )
    }
}
