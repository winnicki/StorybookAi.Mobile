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
    
    var body: some View {
        ZStack {
            Image(item.imageAsset)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(16)
                .padding(6)
                .background(.white)
                .cornerRadius(16)
            
            if item.isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .offset(x: 70, y: -70)
            }
        }
        .onTapGesture {
            try! Realm().write {
                item.isSelected.toggle()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let cardItem = CardItem(imageAsset: "human")
        CardView(item: cardItem)
    }
}


//struct CardView_Previews: PreviewProvider {
//    @State static private var stubSingle: CardItem = CardItem.stubSingle
//
//    static var previews: some View {
//        CardView(item: $stubSingle)
//    }
//}

