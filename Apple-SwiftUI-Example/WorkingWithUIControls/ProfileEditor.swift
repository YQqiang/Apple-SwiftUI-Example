//
//  ProfileEditor.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/10.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.userName)
            }
            
            Toggle(isOn: $profile.perfersNotifications, label: {
                Text("Enable Notifications")
            })
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                Picker("Seasonal Photo", selection: $profile.seasonPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Goal Date").bold()
                DatePicker("Goal Date", selection: $profile.goalDate, displayedComponents: .hourAndMinute)
            })
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(Profile.default))
    }
}
