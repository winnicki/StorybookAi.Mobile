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
    @State var isSelected: Bool
    
    static func == (lhs: NumberItem, rhs: NumberItem) -> Bool {
        return lhs.id == rhs.id
    }
}
