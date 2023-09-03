//
//  RadioButton.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-09-03.
//

import SwiftUI

struct RadioButton<Content>: View where Content: View {
    let option: Int
    @Binding var selectedOption: Int?
    let content: () -> Content

    var body: some View {
        Button(action: {
            selectedOption = option
        }) {
            content()
        }
    }
}
