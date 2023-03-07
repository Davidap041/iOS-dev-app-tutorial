//
//  History.swift
//  Scrumdinger
//
//  Created by Davi Alexandre Paiva on 07/03/23.
//

import Foundation

struct History: Identifiable{
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int

    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], lenghtInMinutes: Int=5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lenghtInMinutes
    }

}
