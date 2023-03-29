//
//  MainHomeVIew.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/30/23.
//

import SwiftUI

struct HomeTabView: View {
    
    @State private var defaultScreen = 2
    var body: some View {
        TabView(selection: $defaultScreen) {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image("Group 30")
                }.tag(1)
            
            SearchView()
                .tabItem {
                    Text("Search")
                    Image("Group 673")
                }.tag(1)
            
            PlayView()
                .tabItem {
                    Text("Play")
                    Image("Group 30")
                }.tag(2)
            
            NotesView()
                .tabItem {
                    Text("Notes")
                    Image("Group 673")
                }.tag(3)
            
            
            MessageView()
                .tabItem {
                    Text("Message")
                    Image("Group 676")
                }.tag(4)
           
        }.accentColor(.black)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
