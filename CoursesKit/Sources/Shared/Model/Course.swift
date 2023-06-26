import Foundation

public struct Course: Codable, Equatable, Identifiable {
  public var id: Int
  public let title: String
  public let description: String
  public let tutor: Tutor
  public let price: Price
  
  public init(id: Int, title: String, description: String, tutor: Tutor, price: Price) {
    self.id = id
    self.title = title
    self.description = description
    self.tutor = tutor
    self.price = price
  }
}

public struct Price: Codable, Equatable {
  public let value: Double
  public let currency: String
  
  public init(value: Double, currency: String) {
    self.value = value
    self.currency = currency
  }
}

extension Course {
  public static let previewIntroToThePiano: Course = .init(
    id: 0,
    title: "An Intro to the Piano",
    description: "Everything you need to get started playing the Piano.",
    tutor: .previewCharlesCornell,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewIntroToImprovisation: Course = .init(
    id: 1,
    title: "Intro to Improvisation",
    description: "Your Introduction to Improvisation.",
    tutor: .previewCharlesCornell,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewMakingSenseOfModes: Course = .init(
    id: 2,
    title: "Making sense of Modes",
    description: "What modes are, how to play them and how to actually use them.",
    tutor: .previewCharlesCornell,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewHarmony101: Course = .init(
    id: 3,
    title: "Harmony 101",
    description: "Your In-Depth to understanding and applying harmony.",
    tutor: .previewDavidDeJesus,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewImprovObstacleCourse: Course = .init(
    id: 4,
    title: "Improv Obstacle Course",
    description: "The 30-part challenge to help you reach new improvisational heights.",
    tutor: .previewDavidDeJesus,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewIntroToMusicTheory: Course = .init(
    id: 5,
    title: "Intro to Music Theory",
    description: "Your Introduction to Music Theory.",
    tutor: .previewCharlesCornell,
    price: .init(value: 99.0, currency: "EUR")
  )
  
  public static let previewPianoJumpstart: Course = .init(
    id: 6,
    title: "Piano Jumpstart",
    description: "Gitting you to play the Piano in no-time.",
    tutor: .previewCharlesCornell,
    price: .init(value: 99.0, currency: "EUR")
  )
}
