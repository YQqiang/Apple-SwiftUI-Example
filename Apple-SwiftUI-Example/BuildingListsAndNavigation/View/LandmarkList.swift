//
//  LandmarkList.swift
//  Apple-SwiftUI-Example
//
//  Created by yuqiang on 2020/11/1.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(
                    destination: LandmarkDetail(landmark: landmark),
                    label: {
                        LandmarkRow(landmark: landmark)
                    })
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPad pro(9.7-inch)"], id: \.self) {
            LandmarkList().previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
        }
    }
}
