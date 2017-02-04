import Swiftline
import Dispatch

struct AsanaClient {
    
    static func put(network: Network, workspaceName: String, accessToken: String) {
        
        print("Fetching workspaces".f.Green)
        
        guard let workspace = HTTPClient.send(with: WorkspaceGetRequest(accessToken: accessToken)).filter({$0.name == workspaceName}).first else {
            return
        }
        
        print("start creating projects".f.Green)
        
        for project in network.projects {
            
            print("creating project \(project.title)".f.Green)
            
            let projectStatus = HTTPClient.send(with: ProjectCreateRequest(accessToken: accessToken, name: project.title, workspace: workspace.id))
            sleep(2)
            
            print("start creating tasks".f.Green)
            
            for task in project.tasks {
                
                print("creating task \(task.title)".f.Green)
                
                let request = TaskCreateRequest(accessToken: accessToken, dueOn: task.deadline, name: task.title, projectId: projectStatus.id, parentId: nil, completed: task.status.isComleted)
                let taskStatus = HTTPClient.send(with: request)
                sleep(2)
                
                print("start creating notes".f.Green)
                
                for note in task.notes {
                    
                    print("creating note \(note.message)".f.Green)
                    
                    _ = HTTPClient.send(with: StoryCreateRequest(accessToken: accessToken, text: note.message, taskId: taskStatus.id))
                    sleep(2)
                }
                
                print("start creating subtasks".f.Green)
                
                for subtask in task.subTasks ?? [] {
                    
                    print("creating note \(subtask.title)".f.Green)
                    
                    let request = TaskCreateRequest(accessToken: accessToken, dueOn: subtask.deadline, name: subtask.title, projectId: nil, parentId: taskStatus.id, completed: subtask.status.isComleted)
                    _ = HTTPClient.send(with: request)
                    sleep(2)
                }
            }
            
        }
    }
}
