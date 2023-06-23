import ComposableArchitecture
import CourseClientLive
import CourseListFeature
import SwiftUI

@main
struct CoursesApp: App {
  let store = Store(
    initialState: .init(),
    reducer: CourseListReducer()
  )
  
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            CourseList(store: store)
          }
        }
    }
}
