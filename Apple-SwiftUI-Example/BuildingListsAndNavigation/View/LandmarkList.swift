//
//  LandmarkList.swift
//  Apple-SwiftUI-Example
//
//  Created by yuqiang on 2020/11/1.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(
                    destination: LandmarkDetail(),
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
        LandmarkList()
    }
}
