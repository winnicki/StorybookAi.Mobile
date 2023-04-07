//
//  SecondaryButtonStyle.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import Foundation
import SwiftUI

struct SecondaryButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(24)
            .font(.custom("SFProText-Semibold", size: 24))
            .foregroundColor(.black)
    }
}
