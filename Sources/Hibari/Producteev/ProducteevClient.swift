import Swiftline

struct ProducteevClient {

    static func fetch() -> [Network] {
        
        print("Fetching networks".f.Green)
        
        // Fetch networks
        let networks = HTTPClient.send(with: NetworkGetRequest())
        
        for network in networks {
            
            print("Fetching projects in \(network.title)".f.Green)
            
            // Fetch projects
            let projects = HTTPClient.send(with: ProjectGetRequest(networkId: network.id))
            network.projects = projects
            
            for project in projects {
                
                print("Fetching tasks in \(project.title)".f.Green)
                
                // Fetch tasks
                let tasks = HTTPClient.send(with: TaskGetRequest(projectId: project.id))
                project.tasks = tasks
                
                for task in tasks where task.noteCount != nil && task.noteCount! > 0 {
                    
                    print("Fetching notes in \(task.title)".f.Green)
                    
                    // Fetch notes
                    let notes = HTTPClient.send(with: NoteGetRequest(taskId: task.id))
                    task.notes = notes
                }
            }
        }
        
        return networks
    }
}
