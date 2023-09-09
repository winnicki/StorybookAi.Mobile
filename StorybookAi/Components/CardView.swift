//
//  CardView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct CardView: View {
    
    @ObservedRealmObject var item: CardItem
    var onSelect: (CardItem) -> Void
    
    var body: some View {
        Group {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(item.name)
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
            .background(Image(item.imageAsset).resizable().scaledToFill())
            .cornerRadius(24)
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect(item)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let cardItem = CardItem(imageAsset: "human")
            CardView(item: cardItem) { CardItem in
        }
    }
}


//struct CardView_Previews: PreviewProvider {
//    @State static private var stubSingle: CardItem = CardItem.stubSingle
//
//    static var previews: some View {
//        CardView(item: $stubSingle)
//    }
//}

