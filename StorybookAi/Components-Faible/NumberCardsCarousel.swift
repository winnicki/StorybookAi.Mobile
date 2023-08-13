//
//  NumberCardsCarousel.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-08-06.
//

import SwiftUI

struct NumberCardsCarousel: View {
    @Binding var items: [NumberItem]
    @State private(set) var SelectedItem: NumberItem?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 24) {
                ForEach(items.indices, id: \.self) { index in
                    NumberCardView(item: items[index], onSelect: handleCardSelection)
                }
            }
            .padding(.leading, 60)
            .padding(.trailing, 80)
            .padding(.top, 20)
            .padding(.bottom, 20)
            Spacer()
        }
    }
    
    func handleCardSelection(selectedCard: NumberItem) {
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

struct NumberCardsCarousel_Previews: PreviewProvider {
    @State static private var stubMultiple: [NumberItem] = NumberItem.stubMultiple

    static var previews: some View {
        NumberCardsCarousel(items: $stubMultiple)
    }}
