//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct NumberCardView: View {
    
    @State var item: NumberItem
    
    var onSelect: (NumberItem) -> Void
    
    var body: some View {
        Text(String(item.value))
            .font(Font.custom("SF Pro Text", size: 24).weight(.semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.vertical, 24)
            .padding(.horizontal, 36)
            .background(item.isSelected ? Color(red: 1, green: 0.64, blue: 0.47) : .clear)
            .background(Color("FaibleBackground"))
            .cornerRadius(24)
            .contentShape(Rectangle())
            .onTapGesture {
                toggleSelection()
            }
    }
    
    public func toggleSelection() {
        item.isSelected.toggle()
        onSelect(item)
    }
}

struct NumberCardView_Previews: PreviewProvider {
    static var previews: some View {
        let NumberItem = NumberItem(value:1, isSelected: true)
            NumberCardView(item: NumberItem) { NumberItem in
        }
    }
}
