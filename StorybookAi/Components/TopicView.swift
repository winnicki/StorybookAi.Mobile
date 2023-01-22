//
//  TopicView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-26.
//

import SwiftUI
import RealmSwift

struct TopicView: View {
    
    let topic: Topic
    @State private var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Text(topic.emoji!)
            Text(topic.name!)
                .font(Font.custom("Poppins-SemiBold", size: 13))
                .foregroundColor(isSelected ? .alwaysLight : .primary)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Capsule().foregroundColor(isSelected ? Color.blue : .neutral))
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(topic:Topic.stubSingle)
    }
}
