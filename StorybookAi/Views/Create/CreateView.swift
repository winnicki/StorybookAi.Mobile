//
//  CreateView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        VStack {
            HStack {
                Text("CREATE A NEW STORY")
                    .font(.custom("Fredoka-Medium", size: 50))
                Spacer()
                Button("Skip", action: skip)
                    .buttonStyle(SecondaryButtonStyle())
            }
            .padding(.top, 100)
            Spacer()
            NameInput()
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
        CreateView()
    }
}
