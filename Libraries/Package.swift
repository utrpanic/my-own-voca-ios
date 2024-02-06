// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Libraries",
  platforms: [.iOS(.v17)],
  products: [
    .library(name: "Libraries", targets: [
      "Features", "Repositories",
    ]),
  ],
  targets: [
    .target(
      name: "Features",
      dependencies: ["Repositories"],
      path: "Features"
    ),
    .target(
      name: "Repositories",
      path: "Repositories"
    ),
  ]
)
