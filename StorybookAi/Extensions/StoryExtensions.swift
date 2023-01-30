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
                "Cover" : "https://replicate.delivery/pbxt/fZOmFhXfeHIHGoW4n4ZBAVVJXfty1S5HVezDFYE1fDVuP9LGE/out-0.png",
                "Pages" : [
                    Story_Pages(value: ["Number" : 1, "Paragraph" : "Once upon a time there was a brave little 3 year old boy named Eddy who lived in a magical kingdom not far away. At night, he could always hear the castle bells ringing to remind him of the adventures he could have.", "ImageUrl" : "https://replicate.delivery/pbxt/fZOmFhXfeHIHGoW4n4ZBAVVJXfty1S5HVezDFYE1fDVuP9LGE/out-0.png"]),
                    Story_Pages(value: ["Number" : 2, "Paragraph" : "One night, Eddy had a dream of a castle in the sky. He grabbed his trusty sword and said “I'm going to explore this castle!” Taking a deep breath, he ventured off into the night, his courage and determination never wavering.", "ImageUrl" : "https://replicate.delivery/pbxt/c9n2AbGoZK41LBtbAuUqFebRUpkmfhofnf9gxuzhUjooUfFDC/out-0.png"]),
                ]])
    }
}
