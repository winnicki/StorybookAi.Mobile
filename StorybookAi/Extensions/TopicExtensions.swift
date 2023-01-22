//
//  TopicExtensions.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-26.
//

import Foundation

extension Topic {
    static var stubSingle: Topic {
        Topic(value: ["name": "Body Building", "color" : "AppleGreen", "avatar": "AppleAvatar", "emoji": "🏋🏿‍♀️"])
    }
    static var stubMultiple: [Topic] {
        [
            Topic(value: ["name": "Ask a Local", "emoji": "🏙️", "color" : "AppleGreen", "avatar" : "AppleAvatar"]),
            Topic(value: ["name": "Coffee", "emoji": "☕", "color" : "Banana", "avatar" : "BananaAvatar"]),
            Topic(value: ["name": "Real Estate", "emoji": "🏠", "color" : "BluePurple", "avatar" : "BluePurpleAvatar"]),
            Topic(value: ["name": "Bikes", "emoji": "🚲", "color" : "AppleGreen", "avatar" : "AppleAvatar"]),
            Topic(value: ["name": "Body Building", "emoji": "🏋🏿‍♀️", "color" : "Banana", "avatar" : "BananaAvatar"]),
            Topic(value: ["name": "Automotive", "emoji": "🚗", "color" : "BluePurple", "avatar" : "BluePurpleAvatar"]),
            Topic(value: ["name": "Coding", "emoji": "⌨️", "color" : "AppleGreen", "avatar" : "AppleAvatar"]),
        ]
    }
}
