//
//  RadioButton.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-09-03.
//

import SwiftUI

struct RadioButton<Content>: View where Content: View {
    let option: String
    @Binding var selectedOption: String?
    let content: () -> Content

    var body: some View {
        Button(action: {
            selectedOption = option
        }) {
            content()
        }
    }
}
