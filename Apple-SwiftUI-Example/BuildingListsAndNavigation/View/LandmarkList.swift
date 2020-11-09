//
//  LandmarkList.swift
//  Apple-SwiftUI-Example
//
//  Created by yuqiang on 2020/11/1.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        // To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
        List {
            // You use the $ prefix to access a binding to a state variable, or one of its properties.
            Toggle(isOn: $userData.showFavoritesOnly, label: {
                Text("Favorites only")
            })
            
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData),
                        label: {
                            LandmarkRow(landmark: landmark)
                        })
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPad pro(9.7-inch)"], id: \.self) {
            LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
        }
    }
}
