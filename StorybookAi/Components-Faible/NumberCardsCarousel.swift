//
//  NumberCardsCarousel.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-08-06.
//

import SwiftUI

struct NumberCardsCarousel: View {
    private let items = [1, 2, 3, 4, 5] // Replace with your desired values
    @State private var selectedItem: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 24) {
                ForEach(items, id: \.self) { value in
                    NumberCardView(value: value, isSelected: isSelected(value), onSelect: handleCardSelection(selectedCard:))
                }
            }
            .padding(.leading, 60)
            .padding(.trailing, 80)
            .padding(.top, 20)
            .padding(.bottom, 20)
            Spacer()
        }
    }
    
    private func isSelected(_ cardValue: Int) -> Bool {
        return selectedItem == cardValue
    }
    
    private func handleCardSelection(selectedCard: Int) {
        if selectedItem == selectedCard {
            selectedItem = nil
        } else {
            selectedItem = selectedCard
        }
    }
}

struct NumberCardsCarousel_Previews: PreviewProvider {
    static var previews: some View {
        NumberCardsCarousel()
    }
}
