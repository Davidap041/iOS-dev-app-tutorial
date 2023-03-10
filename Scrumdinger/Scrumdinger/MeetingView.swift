//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Davi Alexandre Paiva on 28/01/23.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum : DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer{AVPlayer.sharedDingPlayer}
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack{
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                
            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .onAppear {
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
                scrumTimer.speakerChangedAction = {
                             player.seek(to: .zero)
                         }
                scrumTimer.startScrum()
            }
            .onDisappear {
                scrumTimer.stopScrum()
                let newHistory = History(attendees: scrum.attendees, lenghtInMinutes: scrum.timer.secondsElapsed/60)
                scrum.history.insert(newHistory, at: 0)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
