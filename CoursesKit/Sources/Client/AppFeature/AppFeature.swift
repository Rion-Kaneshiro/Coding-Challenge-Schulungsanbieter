import ComposableArchitecture
import CourseListFeature
import Foundation

public struct AppFeature: ReducerProtocol {
  public struct State: Equatable {
    var listState: CourseListFeature.State
    
    public init(listState: CourseListFeature.State = .init()) {
      self.listState = listState
    }
  }
  
  public enum Action: Equatable {
    case list(CourseListFeature.Action)
  }
  
  public init() {}
  
  public var body: some ReducerProtocolOf<Self> {
    Scope(state: \.listState, action: /Action.list) {
      CourseListFeature()
    }
    Reduce { state, action in
      switch action {
      case .list:
        return .none
      }
    }
  }
}

