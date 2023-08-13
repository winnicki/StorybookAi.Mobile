//
//  NumberItem.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-08-06.
//

import Foundation
import SwiftUI

struct NumberItem: Identifiable, Equatable {
    var id = UUID()
    var value: Int
    var isSelected: Bool
}
