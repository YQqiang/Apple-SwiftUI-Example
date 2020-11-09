//
//  CategoryRow.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/9.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark),
                            label: {
                                CategoryItem(landmark: landmark)
                            })
                    }
                })
            })
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5.0)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4)))
    }
}
