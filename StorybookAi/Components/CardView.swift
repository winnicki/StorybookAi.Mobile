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
                        .font(.custom("Poppins-SemiBold", size: 16)) // TODO: add font extensions
                        .padding(8)
                        .foregroundColor(.alwaysLight)
                        .background(.black)
                }
                Spacer()
            }
            .frame(width: 200, height: 200)
            .padding()
            .background(AsyncImage(url: URL(string: item.imageUrl!)))
            .background(Color("SelectedDim"))
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
