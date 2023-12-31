import ComposableArchitecture
import CourseDetailFeature
import Foundation
import Model
import SwiftUI

public struct CourseList: View {
  let store: StoreOf<CourseListFeature>
  
  public init(store: StoreOf<CourseListFeature>) {
    self.store = store
  }
  
  public var body: some View {
    NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
      WithViewStore(self.store, observe: { $0 }) { viewStore in
        List {
          ForEach(viewStore.courses) { course in
            NavigationLink(state: CourseDetailFeature.State(course: course)) {
              CourseRow(
                title: course.title,
                description: course.description,
                tutorName: course.tutor.name
              )
            }
          }
        }
        .refreshable {
          Task {
            viewStore.send(.fetch)
          }
        }
        .navigationTitle("Courses")
        .task {
          viewStore.send(.fetch)
        }
      }
    } destination: { store in
      CourseDetail(store: store)
    }
  }
}

struct CourseRow: View {
  
  let title: String
  let description: String
  let tutorName: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.title2)
      Text(description)
        .font(.caption)
      
      Label(tutorName, systemImage: "person.circle")
    }
  }
}

struct TrainingEventsList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      CourseList(
        store: .init(
          initialState: .init(),
          reducer: CourseListFeature()
        )
      )
    }
  }
}

