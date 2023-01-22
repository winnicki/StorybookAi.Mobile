//
//  HeadlineView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-25.
//

import SwiftUI

struct HeadlineView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 16))
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView(title: "Topics")
    }
}
