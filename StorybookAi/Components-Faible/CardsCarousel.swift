//
//  CardsCarousel.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI
import RealmSwift

struct CardsCarousel: View {
    @Binding var items: [CardItem]
    @State private var selectedItem: CardItem?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 24) {
                ForEach(items.indices, id: \.self) { index in
                    CardView(item: items[index], onSelect: handleCardSelection)
                }
            }
            .padding(.leading, 60)
            .padding(.trailing, 80)
            .padding(.top, 20)
            .padding(.bottom, 20)
            Spacer()
        }
    }
    
    func handleCardSelection(selectedCard: CardItem) {
        try! Realm().write {
            if selectedItem == selectedCard {
                selectedItem?.isSelected.toggle()
                selectedItem = nil
            } else {
                selectedItem?.isSelected = false
                selectedItem = selectedCard
                selectedItem?.isSelected = true
            }
        }   
    }
}

struct CardsCarousel_Previews: PreviewProvider {
    @State static private var stubMultiple: [CardItem] = CardItem.stubMultiple

    static var previews: some View {
        CardsCarousel(items: $stubMultiple)
    }
}

