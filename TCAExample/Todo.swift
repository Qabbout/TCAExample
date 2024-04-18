//
//  Todo.swift
//  TCAExample
//
//  Created by Abdulrahman Qabbout on 18/04/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct Todo {
  @ObservableState
  struct State: Equatable, Identifiable {
    var description = ""
    let id: UUID
    var isComplete = false
  }

  enum Action: BindableAction {
    case binding(BindingAction<State>)
  }

  var body: some Reducer<State, Action> {
    BindingReducer()
  }
}
