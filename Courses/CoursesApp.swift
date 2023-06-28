import ComposableArchitecture
import AppFeature
import SwiftUI

@main
struct CoursesApp: App {
  let store = Store(
    initialState: .init(),
    reducer: AppFeatureReducer()
  )
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        AppView(store: self.store)
      }
    }
  }
}
