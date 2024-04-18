//
//  TodosApp.swift
//  TCAExample
//
//  Created by Abdulrahman Qabbout on 18/04/2024.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
  @Bindable var store: StoreOf<Todos>

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Picker("Filter", selection: $store.filter.animation()) {
          ForEach(Filter.allCases, id: \.self) { filter in
            Text(filter.rawValue).tag(filter)
          }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)

        List {
          ForEach(store.scope(state: \.filteredTodos, action: \.todos)) { store in
            TodoView(store: store)
          }
          .onDelete { store.send(.delete($0)) }
          .onMove { store.send(.move($0, $1)) }
        }
      }
      .navigationTitle("Todos")
      .navigationBarItems(
        trailing: HStack(spacing: 20) {
          EditButton()
          Button("Clear Completed") {
            store.send(.clearCompletedButtonTapped, animation: .default)
          }
          .disabled(!store.todos.contains(where: \.isComplete))
          Button("Add Todo") { store.send(.addTodoButtonTapped, animation: .default) }
        }
      )
      .environment(\.editMode, $store.editMode)
    }
  }
}

extension IdentifiedArray where ID == Todo.State.ID, Element == Todo.State {
  static let mock: Self = [
    Todo.State(
      description: "Check Mail",
      id: UUID(),
      isComplete: false
    ),
    Todo.State(
      description: "Buy Milk",
      id: UUID(),
      isComplete: false
    ),
    Todo.State(
      description: "Call Mom",
      id: UUID(),
      isComplete: true
    ),
  ]
}

#Preview {
  AppView(
    store: Store(initialState: Todos.State(todos: .mock)) {
      Todos()
    }
  )
}
