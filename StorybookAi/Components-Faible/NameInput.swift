//
//  NameINput.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI

struct NameInput: View {
    
    @State private var childName: String = ""
//    @FocusState private var isFocused: Bool = true

    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Your child's name:")
                        .font(.custom("SFProText-Regular", size: 24))
                    Spacer()
                }
                TextField(
                        "Alex or Nathalia...",
                        text: $childName
                    )
        //            .focused($isFocused)
                    .onSubmit {
        //                validate(name: childName)
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(.custom("SFProText-Regular", size: 48))
            }
            .padding(24)
            .background(.white)
            .cornerRadius(24)
            .shadow(color: Color.black.opacity(0.15), radius: 30, x: 0, y: 10)
        }
        .padding(.horizontal, 60)
    }
}

struct NameInput_Previews: PreviewProvider {
    static var previews: some View {
        NameInput()
    }
}
