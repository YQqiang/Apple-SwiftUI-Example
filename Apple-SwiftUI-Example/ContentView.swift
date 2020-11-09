//
//  ContentView.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/10/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
