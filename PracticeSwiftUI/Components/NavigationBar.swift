//
//  NavigationBar.swift
//  PracticeSwiftUI
//
//  Created by Derek Winnicki on 2022-06-26.
//

import SwiftUI

struct NavigationBar: View {
    
    var body: some View {
        TitleView()
//            .background(.ultraThinMaterial)
            .background(.background)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
