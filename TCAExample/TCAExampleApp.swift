//
//  TCAExampleApp.swift
//  TCAExample
//
//  Created by Abdulrahman Qabbout on 18/04/2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCAExampleApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(initialState: Todos.State()) {
                    Todos()
                }
            )
        }
    }
}
