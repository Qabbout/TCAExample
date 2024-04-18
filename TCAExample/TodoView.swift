//
//  TodoView.swift
//  TCAExample
//
//  Created by Abdulrahman Qabbout on 18/04/2024.
//
import ComposableArchitecture
import SwiftUI

struct TodoView: View {
  @Bindable var store: StoreOf<Todo>

  var body: some View {
    HStack {
      Button {
        store.isComplete.toggle()
      } label: {
        Image(systemName: store.isComplete ? "checkmark.square" : "square")
      }
      .buttonStyle(.plain)

      TextField("Untitled Todo", text: $store.description)
    }
    .foregroundColor(store.isComplete ? .gray : nil)
  }
}
