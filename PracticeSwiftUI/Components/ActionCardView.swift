//
//  ActionCard.swift
//  PracticeSwiftUI
//
//  Created by Derek Winnicki on 2022-06-25.
//

import Foundation
import SwiftUI

struct ActionCardView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Intro to Algorithms")
                    .font(.custom("Poppins-SemiBold", size: 17))
                Text("Coding : Today at 3:45 PM ")
                    .font(Font.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.gray600)
                HStack {
                    Text("Join")
                        .font(Font.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(.alwaysLight)
                }
                .frame(width: 100)
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background(Capsule().foregroundColor(.lightBlue))
                .onTapGesture {
                }
                Spacer()
            }
            .padding(.top, 20)
            Spacer()
//            Rectangle()
//                .foregroundColor(.bluePurple)
//                .cornerRadius(25)
//                .padding(.vertical)
//                .frame(width: 100)
                            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 144)
        .background(Color("Neutral"))
        .cornerRadius(25)
//        .shadow(color: Color.black.opacity(0.15), radius: 30, x: 0, y: 10)
    }
}

struct ActionCard_Previews: PreviewProvider {
    static var previews: some View {
        ActionCardView()
    }
}
