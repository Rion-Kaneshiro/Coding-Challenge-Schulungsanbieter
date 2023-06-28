import ComposableArchitecture
import CourseListFeature
import CourseClientLive
import Foundation
import SwiftUI

public struct AppView: View {
  let store: StoreOf<AppFeatureReducer>
  
  public init(store: StoreOf<AppFeatureReducer>) {
    self.store = store
  }
  
  public var body: some View {
    CourseList(store: self.store.scope(state: \.listState, action: { .list($0) }))
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(
      store: .init(
        initialState: .init(),
        reducer: AppFeatureReducer(),
        prepareDependencies: {
          $0.apiClient = .previewValue
        }
      )
    )
  }
}
