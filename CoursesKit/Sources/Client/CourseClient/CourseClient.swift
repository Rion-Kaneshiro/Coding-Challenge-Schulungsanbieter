import Dependencies
import Foundation
import Model
import SiteRouter
import URLRouting

extension URLRoutingClient: TestDependencyKey where Route == SiteRoute {
  public static var testValue: URLRoutingClient = .failing
  public static var previewValue: URLRoutingClient {
    return .init { route in
      switch route {
      case .courses(.fetch):
        return try Result.ok(Course.allPreviews).get()
      case let .courses(.course(id, event)):
        switch event {
        case .fetch:
          return try Result.ok([Event]()).get()
        case let .create(create):
          return try Result.ok([Event(id: .init(), courseId: id, date: create.date.timeIntervalSince1970, enrolled: false)]).get()
        }
      }
    }
  }
}

extension DependencyValues {
  public var apiClient: URLRoutingClient<SiteRoute> {
    get { self[URLRoutingClient.self] }
    set { self[URLRoutingClient.self] = newValue }
  }
}
