//
//  StoryExtensions.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-01-22.
//

import Foundation

extension Story {
    static var stubSingle: Story {
        Story(
            value: [
                "Title" : "Bedtime Story",
                "Pages" : [
                    Story_Pages(value: ["Number" : 1, "Paragraph" : "Once upon a time there was a boy named Derek."]),
                    Story_Pages(value: ["Number" : 2, "Paragraph" : "One day he took a trip to the city."]),
                ]])
    }
}
