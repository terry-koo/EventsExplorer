//
//  EventsExplorerApp.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

import SwiftUI

@main
struct EventsExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: EventViewModel())
        }
    }
}
