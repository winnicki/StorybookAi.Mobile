//
//  RadioButtonView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-09-03.
//

import SwiftUI

struct RadioButtonView<Content>: View where Content: View {
    @Binding var selectedOption: Int?
    let options: [Int]
    let isHorizontal: Bool
    let content: (Int) -> Content

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
            .padding()
        } else {
            VStack {
                radioButtonList()
            }
            .padding()
        }
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    @State private static var selectedDuration: Int? = 1

    static var previews: some View {
        RadioButtonView(selectedOption: $selectedDuration, options: [1, 2, 3], isHorizontal: true) { option in
            NumberCardView(option: option, selectedOption: $selectedDuration)
        }
    }
}

