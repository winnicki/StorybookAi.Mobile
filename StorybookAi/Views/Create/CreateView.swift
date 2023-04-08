//
//  CreateView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI

struct CreateView: View {
    
    let items: [CardItem]
    
    var body: some View {
        VStack {
            HStack {
                Text("CREATE A NEW STORY")
                    .font(.custom("Fredoka-SemiBold", size: 50))
                Spacer()
                Button("Skip", action: skip)
                    .buttonStyle(SecondaryButtonStyle())
            }
            .padding(.top, 100)
            HStack {
                Text("This is the subheader sentence for some steps")
                    .font(.custom("SFProText-Regular", size: 24))
                Spacer()
            }
            Spacer()
//            NameInput()
            CardsCarousel(items: items)
            Spacer()
            HStack {
                Button("Cancel", action: cancel)
                    .buttonStyle(SecondaryButtonStyle())
                Button("Next", action: next)
                    .buttonStyle(PrimaryRoundedButtonStyle())
            }
            .padding(.bottom, 100)
        }
        .padding(.horizontal, 154)
        .background(Color("FaibleBackground"))
    }
    
    func next() {
        
    }
    
    func cancel() {
        
    }
    
    func skip() {
        
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(items:CardItem.stubMultiple)
    }
}
