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
//                Image()
                Spacer()
                Text("John Smith")
                    .font(.custom("Poppins-SemiBold", size: 16)) // TODO: add font extensions
                    .foregroundColor(.alwaysDark)
                Text(story.Title!)
                    .font(Font.custom("Poppins-Regular", size: 13))
                    .foregroundColor(.alwaysDark)
            }
            Spacer()
        }
        .frame(width: 136, height: 144)
        .padding()
        .background(Color(.blue)) // TODO: add color extension compatible with this type
        .cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(story:Story.stubSingle)
    }
}
