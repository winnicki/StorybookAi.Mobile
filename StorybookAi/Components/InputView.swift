//
//  InputView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-09-03.
//

import SwiftUI
 
struct InputView<Content>: View where Content: View {
    
    @State var header : String = ""
    let content: () -> Content
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(header)
                        .font(.custom("SFProText-Regular", size: 24))
                    Spacer()
                }
                content()
                    .padding()
            }
            .padding(24)
            .background(.white)
            .cornerRadius(24)
            .shadow(color: Color.black.opacity(0.15), radius: 30, x: 0, y: 10)
        }
        .padding(.horizontal, 60)
    }
}


struct InputView_Previews: PreviewProvider {
    @State private static var header: String = "Your child's name:"
    static var previews: some View {
        InputView(header: header) {
            HStack {
                Text("Alex")
                    .font(.custom("SFProText-Regular", size: 48))
                Spacer()
            }
        }
    }
}
