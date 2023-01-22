//
//  HomeView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

struct HomeView : View {
    
    @ObservedResults(Story.self) var stories
    let heightOfTabBar: CGFloat = 76
    let heightOfNavBar: CGFloat = 70
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    
                    HeadlineView(title: "My Stories")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(stories, id: \.self) { story in
                                NavigationLink {
                                    StoryView(story: story)
                                } label : {
                                    CardView(story: story)
                                }
                            }
                        }
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
            HomeView()
        }
    }}
