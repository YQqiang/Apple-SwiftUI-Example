//
//  ProfileSummary.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/10.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.userName)
                .bold()
                .font(.title)
            Text("Notifications: \(self.profile.perfersNotifications ? "On" : "Off")")
            Text("Season Photos: \(self.profile.seasonPhoto.rawValue)")
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormatter)")
            
            VStack(alignment: .leading) {
                Text("Complete Badge")
                    .bold()
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(.init(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.50)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
