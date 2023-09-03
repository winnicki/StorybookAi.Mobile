//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct NumberCardView: View {
    
    var value: Int
    @State var isSelected: Bool
    var onSelect: (Int) -> Void
    
    var body: some View {
        Text(String(value))
            .font(Font.custom("SF Pro Text", size: 24).weight(.semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.vertical, 24)
            .padding(.horizontal, 36)
            .background(isSelected ? Color(red: 1, green: 0.64, blue: 0.47) : .clear)
            .background(Color("FaibleBackground"))
            .cornerRadius(24)
            .contentShape(Rectangle())
            .onTapGesture {
                toggleSelection()
            }
    }
    
    public func toggleSelection() {
        isSelected.toggle()
        onSelect(value)
    }
}

struct NumberCardView_Previews: PreviewProvider {
    @State static var isSelected = true  // Add a @State property
    static var previews: some View {
        NumberCardView(value: 1, isSelected: isSelected) { selectedValue in
            isSelected.toggle()
        }
    }
}

