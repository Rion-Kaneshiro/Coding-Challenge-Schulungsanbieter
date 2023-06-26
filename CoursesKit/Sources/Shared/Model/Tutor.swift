import Foundation

public struct Tutor: Codable, Equatable, Identifiable {
  public let id: Int
  public let name: String
  
  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}

extension Tutor {
  public static let previewCharlesCornell = Tutor(id: 0, name: "Charles Cornel")
  public static let previewDavidDeJesus = Tutor(id: 1, name: "David DeJesus")
}
