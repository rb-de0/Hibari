import Swiftline
import Foundation

print("Hello".f.Blue)

let producteevAccessToken = ask("Enter Producteev accessToken", type: String.self)

let asanaAccessToken = ask("Enter Asana accessToken", type: String.self)

let targetWorkspaceName = ask("Enter workspace name", type: String.self)

let networks = ProducteevClient.fetch(accessToken: producteevAccessToken)

if let network = networks.first {
    AsanaClient.put(network: network, workspaceName: targetWorkspaceName, accessToken: asanaAccessToken)
}
