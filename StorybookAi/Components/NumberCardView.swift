//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct NumberCardView: View {
    
    let option: String
    @Binding var selectedOption: String?
    
    var body: some View {
        Text(String(option))
            .font(Font.custom("SF Pro Text", size: 24).weight(.semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.vertical, 24)
            .padding(.horizontal, 36)
            .background(selectedOption == option ? Color(red: 1, green: 0.64, blue: 0.47) : .clear)
            .background(Color("FaibleBackground"))
            .cornerRadius(24)
            .contentShape(Rectangle())
    }
}

struct NumberCardView_Previews: PreviewProvider {
    static var previews: some View {
        NumberCardView(option: "1", selectedOption: .constant("1")) // Use .constant to provide a constant binding
    }
}


