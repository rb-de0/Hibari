import Swiftline
import Foundation

print("Hello".f.Red)

let accessToken = ask("Enter accessToken?", type: String.self)

// Fetch networks
let networks = HTTPClient.send(with: NetworkGetRequest(accessToken: accessToken))

// Fetch projects
for network in networks {
    let projects = HTTPClient.send(with: ProjectGetRequest(accessToken: accessToken, id: network.id))
}
