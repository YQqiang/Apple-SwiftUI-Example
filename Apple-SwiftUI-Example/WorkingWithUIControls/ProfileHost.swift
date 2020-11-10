//
//  ProfileHost.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/10.
//

import SwiftUI

struct ProfileHost: View {
    // Add an Environment view property that keys off of the environment’s \.editMode.
    @Environment(\.editMode) var model
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                Spacer()
                EditButton()
            }
            if self.model?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        })
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
