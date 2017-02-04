import Swiftline
import Dispatch

struct AsanaClient {
    
    static func put(network: Network, workspaceName: String) {
        
        print("Fetching workspaces".f.Green)
        
        guard let workspace = HTTPClient.send(with: WorkspaceGetRequest()).filter({$0.name == workspaceName}).first else {
            return
        }
        
        createProjects(network.projects, into: workspace.id)
    }
    
    private static func createProjects(_ projects: [Project], into workspaceId: Int)  {
        
        print("start creating projects".f.White)
        
        for project in projects {
            
            print("creating project \(project.title)".f.Green)
            
            let projectStatus = HTTPClient.send(with: ProjectCreateRequest(name: project.title, workspace: workspaceId))
            
            createTasks(project.tasks, into: projectStatus.id)
        }
    }
    
    private static func createTasks(_ tasks: [Task], into projectId: Int) {
        
        print("start creating tasks".f.White)
        
        for task in tasks.reversed() {
            
            print("creating task \(task.title)".f.Green)
            
            let request = TaskCreateRequest(dueOn: task.deadline, name: task.title, projectId: projectId, parentId: nil, completed: task.status.isComleted)
            let taskStatus = HTTPClient.send(with: request)
            
            if !task.notes.isEmpty {
                createNotes(task.notes, into: taskStatus.id)
            }
            
            if let subTasks = task.subTasks, !subTasks.isEmpty {
                createSubTasks(subTasks, into: taskStatus.id)
            }
        }
    }
    
    private static func createNotes(_ notes: [Note], into taskId: Int) {
        
        print("start creating notes".f.White)
        
        for note in notes {
            
            print("creating note \(note.message)".f.Green)
            
            _ = HTTPClient.send(with: StoryCreateRequest(text: note.message, taskId: taskId))
        }
    }
    
    private static func createSubTasks(_ subTasks: [Task], into taskId: Int) {
        
        print("start creating subtasks".f.White)
        
        for subtask in subTasks {
            
            print("creating subtasks \(subtask.title)".f.Green)
            
            let request = TaskCreateRequest(dueOn: subtask.deadline, name: subtask.title, projectId: nil, parentId: taskId, completed: subtask.status.isComleted)
            _ = HTTPClient.send(with: request)
        }
    }
}
