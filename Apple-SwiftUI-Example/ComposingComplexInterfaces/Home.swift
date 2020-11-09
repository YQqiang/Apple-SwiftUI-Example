//
//  Home.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/6.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarkData) { (landmark) -> String in
            return landmark.category.rawValue
        }
    }
    
    var fetured: [Landmark] {
        landmarkData.filter { (landmark) -> Bool in
            landmark.isFeatured
        }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: {
            self.showingProfile.toggle()
        }, label: {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        })
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: fetured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(
                    destination: LandmarkList(),
                    label: {
                        Text("See All")
                    })
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile, content: {
                Text("User Profile")
            })
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
