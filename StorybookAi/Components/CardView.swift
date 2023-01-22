//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let topic: Topic
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(topic.avatar)
                Spacer()
                Text("John Smith")
                    .font(.custom("Poppins-SemiBold", size: 16)) // TODO: add font extensions
                    .foregroundColor(topic.color == "Banana" ? .alwaysDark : .alwaysLight)
                Text(topic.name!)
                    .font(Font.custom("Poppins-Regular", size: 13))
                    .foregroundColor(topic.color == "Banana" ? .alwaysDark : .alwaysLight)
            }
            Spacer()
        }
        .frame(width: 136, height: 144)
        .padding()
        .background(Color(topic.color)) // TODO: add color extension compatible with this type
        .cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(topic:Topic.stubSingle)
    }
}
