import ComposableArchitecture
import CourseClient
import CourseDetailFeature
import Dependencies
import Foundation
import Model

public struct CourseListFeature: ReducerProtocol {
  public struct State: Equatable {
    var courses: IdentifiedArrayOf<Course> = []
    
    var path = StackState<CourseDetailFeature.State>()
    
    public init() {}
  }
  
  public enum Action: Equatable {
    case fetch
    case fetchFinished(TaskResult<[Course]>)
    case path(StackAction<CourseDetailFeature.State, CourseDetailFeature.Action>)
  }
  
  enum CancelID {
    case load
  }
  
  @Dependency(\.apiClient) private var client
  
  public init() {}
  
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
      case .fetch:
        return .task {
          await .fetchFinished(
              TaskResult { try await client.decodedResponse(for: .courses()).value }
            )
        }
        .cancellable(id: CancelID.load, cancelInFlight: true)
      case let .fetchFinished(.success(courses)):
        state.courses = .init(uniqueElements: courses)
        return .none
      case let .fetchFinished(.failure(error)):
        print(error)
        return .none
        
      case .path:
        return .none
      }
    }
    .forEach(\.path, action: /Action.path) {
      CourseDetailFeature()
    }
  }
}
