import ComposableArchitecture
import CourseListFeature
import Foundation

public struct AppFeatureReducer: ReducerProtocol {
  public struct State: Equatable {
    var listState: CourseListReducer.State
    
    public init(listState: CourseListReducer.State = .init()) {
      self.listState = listState
    }
  }
  
  public enum Action: Equatable {
    case list(CourseListReducer.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocolOf<Self> {
    Scope(state: \.listState, action: /Action.list) {
      CourseListReducer()
    }
    Reduce { state, action in
      switch action {
      case .list:
        return .none
      }
    }
  }
}

