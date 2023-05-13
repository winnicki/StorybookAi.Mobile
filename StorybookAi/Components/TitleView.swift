//
//  TitleView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-25.
//

import SwiftUI

struct TitleView: View {
    
    var body: some View {
        HStack {
            VStack {
                Text("👋 Welcome to ")
                    .font(.custom("Poppins-SemiBold", size: 20))
                Button("Storybook AI") {
                }
                .font(.custom("Poppins-SemiBold", size: 20))
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .frame(width: 43, height: 43)
                .foregroundColor(.gray600)
                .background(Color("Neutral"), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
            NavigationLink(destination: CreateView()) {
                Image(systemName: "plus")
                    .frame(width: 43, height: 43)
                    .foregroundColor(.gray600)
                    .background(Color("Neutral"), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            Image("BananaAvatar")
        }
        .padding(.vertical, 16)
        .padding(.horizontal)
        .frame(height:70)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
