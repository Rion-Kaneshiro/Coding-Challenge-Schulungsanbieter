import ComposableArchitecture
import Foundation
import SwiftUI

public struct AddEvent: View {
  let store: StoreOf<AddEventFeature>
  
  public init(store: StoreOf<AddEventFeature>) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationStack {
        List {
          DatePicker("Date", selection: viewStore.binding(\.$date))
        }
        .navigationTitle("Add Event")
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Cancel") {
              viewStore.send(.cancelButtonTapped)
            }
          }
          
          ToolbarItem(placement: .topBarTrailing) {
            Button("Done") {
              viewStore.send(.doneButtonTapped)
            }
          }
        }
      }
    }
  }
}

struct AddEvent_Previews: PreviewProvider {
  static var previews: some View {
    AddEvent(
      store: .init(
        initialState: .init(),
        reducer: AddEventFeature()
      )
    )
  }
}
