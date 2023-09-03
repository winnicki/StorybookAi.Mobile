//
//  RadioButtonView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-09-03.
//

import SwiftUI

struct RadioButtonView<Content>: View where Content: View {
    @Binding var selectedOption: String?
    let options: [String]
    let isHorizontal: Bool
    let content: (String) -> Content

    @ViewBuilder
    private func radioButtonList() -> some View {
        ForEach(options, id: \.self) { option in
            RadioButton(option: option, selectedOption: $selectedOption) {
                content(option)
            }
        }
    }

    var body: some View {
        if isHorizontal {
            HStack {
                radioButtonList()
            }
        } else {
            VStack {
                radioButtonList()
            }
        }
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    @State static private var selectedOption: String? = nil
    static var previews: some View {
        RadioButtonView(selectedOption: $selectedOption, options: ["1", "2", "3"], isHorizontal: true) { option in
            NumberCardView(option: option, selectedOption: $selectedOption)
        }
    }
}

