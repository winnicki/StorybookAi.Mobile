//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let item: CardItem
    
    var body: some View {
        Group {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(item.name!)
                        .font(.custom("SFProText-Semibold", size: 24))
                        .padding(8)
                        .foregroundColor(.alwaysLight)
                        .background(.black)
                }
                Spacer()
            }
            .frame(width: 200, height: 200)
            .padding()
            .background(Image(systemName: item.isSelected ? "checkmark.circle.fill" : "")
                    .font(.system(size: 92, weight: .medium))
                    .foregroundColor(.white))
            .background(item.isSelected ? Color("SelectedDim") : .clear)
            .background(Image(item.imageAsset!).resizable().scaledToFill())
            .cornerRadius(24)
        }
        .padding(6)
        .background(.white)
        .cornerRadius(24)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(item:CardItem.stubSingle)
    }
}
