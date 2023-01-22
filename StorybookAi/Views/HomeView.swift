//
//  HomeView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct HomeView : View {
    
//    @ObservedResults(Topic.self) var topics
    let topics: [Topic]
    let heightOfTabBar: CGFloat = 76
    let heightOfNavBar: CGFloat = 70
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    
                    HeadlineView(title: "Filters")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(topics, id: \.self) { topic in
                                TopicView(topic: topic)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    }
                    
                    HeadlineView(title: "Available Now")
                    // Topics horizontal scroll
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(topics, id: \.self) { topic in
//                                GeometryReader { geometry in
                                    CardView(topic: topic)
    //                                    .rotation3DEffect(Angle(degrees:
    //                                            Double(geometry.frame(in: .global).minX - 30) / -20
    //                                        ), axis: (x: 0, y: 10.0, z: 0))
//                                }
//                                    .frame(width: 180, height: 190)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    }
                    
                    HeadlineView(title: "Schedule a Call")
                    ActionCardView()
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    ActionCardView()
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    ActionCardView()
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: heightOfNavBar) 
            })
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: heightOfTabBar)
            })
            .edgesIgnoringSafeArea(.bottom)
            .overlay(NavigationBar())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(topics:Topic.stubMultiple)
    }
}
