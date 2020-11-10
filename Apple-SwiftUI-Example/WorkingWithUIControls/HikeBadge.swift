//
//  HikeBadge.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/10.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack {
            // The two different uses of the frame(width:height:) modifier configure the badge to render at a scaled form of its design-time dimensions of 300 × 300 points.
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Profile Testing")
    }
}
