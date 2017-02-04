import Swiftline
import Foundation

print("Hello".f.White)

let producteevAccessToken = ask("Enter Producteev accessToken", type: String.self)

ProducteevConfig.accessToken = producteevAccessToken

let asanaAccessToken = ask("Enter Asana accessToken", type: String.self)

AsanaConfig.accessToken = asanaAccessToken

let targetWorkspaceName = ask("Enter workspace name", type: String.self)

let networks = ProducteevClient.fetch()

if let network = networks.first {
    AsanaClient.put(network: network, workspaceName: targetWorkspaceName)
}
