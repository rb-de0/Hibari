import Swiftline
import Foundation

print("Hello".f.Red)

let accessToken = ask("Enter accessToken?", type: String.self)

let networks = ProducteevClient.fetchData(accessToken: accessToken)

networks.forEach {
    print($0)
}
