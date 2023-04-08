//
//  CardsCarousel.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI
import RealmSwift

struct CardsCarousel: View {
    
//    @ObservedResults(Story.self) var items
    let items: [CardItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 24) {
                ForEach(items, id: \.self) { item in
                    CardView(item: item)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 80)
            .padding(.top, 20)
            .padding(.bottom, 20)
            Spacer()
        }
    }
}

struct CardsCarousel_Previews: PreviewProvider {
    static var previews: some View {
        CardsCarousel(items:CardItem.stubMultiple)
    }
}
