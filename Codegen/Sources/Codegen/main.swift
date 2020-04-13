import ApolloCodegenLib
import Foundation

let parentFolderOfScriptFile = FileFinder.findParentFolder()
let sourceRootURL = parentFolderOfScriptFile
  .deletingLastPathComponent() // Sources
  .deletingLastPathComponent() // Codegen
  .deletingLastPathComponent() // apollo-ios

let cliFolderURL = sourceRootURL
.appendingPathComponent("Codegen")
.appendingPathComponent("ApolloCLI")


let endpoint = URL(string: "https://engine.unchained.shop/graphql")!

let output = sourceRootURL
.appendingPathComponent("ios-native-storefront")

try FileManager
.default
.apollo_createFolderIfNeeded(at: output)

let options = ApolloSchemaOptions(endpointURL: endpoint, outputFolderURL: output)
let codegenOptions = ApolloCodegenOptions(targetRootURL: output)


do {
    try ApolloSchemaDownloader.run(with: cliFolderURL,
                                 options: options)
    try ApolloCodegen.run(from: output,
    with: cliFolderURL,
    options: codegenOptions)
} catch {
  exit(1)
}
