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
    @State private(set) var SelectedItem: CardItem?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 24) {
                ForEach(items.indices, id: \.self) { index in
                    CardView(item: items[index], onSelect: handleCardSelection)
                }
            }
            .padding(.leading, 60)
            .padding(.trailing, 80)
            .padding(.vertical, 60)
        }
    }
    
    func handleCardSelection(selectedCard: CardItem) {
        try! Realm().write {
            if SelectedItem == selectedCard {
                SelectedItem?.isSelected.toggle()
                SelectedItem = nil
            } else {
                SelectedItem?.isSelected = false
                SelectedItem = selectedCard
                SelectedItem?.isSelected = true
            }
        }   
    }
}

struct CardsCarousel_Previews: PreviewProvider {
    @State static private var stubMultiple: [CardItem] = CardItem.stubMultipleArtStyleItems

    static var previews: some View {
        CardsCarousel(items: $stubMultiple)
            .background(Color("FaibleBackground"))
    }
}

