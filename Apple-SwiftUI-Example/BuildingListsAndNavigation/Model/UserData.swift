//
//  UserData.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/1.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    // An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var showFavoritesOnly: Bool = false
    @Published var landmarks = landmarkData
}
