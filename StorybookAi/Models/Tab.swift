//
//  Tab.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-27.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home),
    TabItem(text: "Search", icon: "magnifyingglass", tab: .search),
    TabItem(text: "Profile", icon: "person.crop.circle", tab: .profile)
]

enum Tab: String {
    case home
    case search
    case profile
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
