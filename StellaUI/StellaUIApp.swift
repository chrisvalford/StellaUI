//
//  StellaUIApp.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

@main
struct StellaUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingContainerView(selectedTab: 1)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
