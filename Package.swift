import PackageDescription

let package = Package(
    name: "Hibari",
    dependencies: [
        .Package(url: "https://github.com/Swiftline/Swiftline.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/ishkawa/APIKit.git", majorVersion: 3),
        .Package(url: "https://github.com/ikesyo/Himotoki.git", majorVersion: 3)
    ]
)
