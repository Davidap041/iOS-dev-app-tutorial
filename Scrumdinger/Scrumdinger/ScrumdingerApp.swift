//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Davi Alexandre Paiva on 28/01/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}

