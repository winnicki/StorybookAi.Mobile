//
//  StoryView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-01-22.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    let heightOfTabBar: CGFloat = 76
    
    var body: some View {
        TabView {
            ForEach(story.Pages, id: \.self) { page in
                Text(page.Paragraph!)
                    .padding()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: heightOfTabBar)
        })
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: Story.stubSingle)
    }
}
