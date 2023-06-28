import ComposableArchitecture
import AppFeature
import SwiftUI

@main
struct CoursesApp: App {
  let store = Store(
    initialState: .init(),
    reducer: AppFeature()
  )
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        AppView(store: self.store)
      }
    }
  }
}
