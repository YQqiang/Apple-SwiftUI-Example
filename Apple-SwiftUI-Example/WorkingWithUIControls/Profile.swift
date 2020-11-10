//
//  Profile.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/10.
//

import Foundation

struct Profile {
    var userName: String
    var perfersNotifications: Bool
    var seasonPhoto: Season
    var goalDate: Date
    
    static let `default` = Profile(userName: "g_kumar", perfersNotifications: true, seasonPhoto: .winter)
    
    init(userName: String, perfersNotifications: Bool = true, seasonPhoto: Season = .winter) {
        self.userName = userName
        self.perfersNotifications = perfersNotifications
        self.seasonPhoto = seasonPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}


