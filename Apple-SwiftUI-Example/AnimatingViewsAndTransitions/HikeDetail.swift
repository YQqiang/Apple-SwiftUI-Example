//
//  HikeDetail.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/5.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace),
    ]
    
    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            HStack(spacing: 20, content: {
                ForEach(buttons, id: \.self.0) { value in
                    Button(action: {
                        self.dataToShow = value.1
                    }, label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow ? .gray : .accentColor)
                            .animation(nil)
                    })
                }
            })
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: hikeData[0])
    }
}
