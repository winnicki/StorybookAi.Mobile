//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let story: Story
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(story.Title!)
                    .font(.custom("Poppins-SemiBold", size: 16)) // TODO: add font extensions
                    .padding(8)
                    .foregroundColor(.alwaysLight)
                    .background(.black)
            }
            Spacer()
        }
        .frame(width: 200, height: 200)
        .padding()
        .background(AsyncImage(url: URL(string: story.Cover!)))
        .cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(story:Story.stubSingle)
    }
}
