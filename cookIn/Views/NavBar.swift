//
//  NavBar.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI

struct NavBar: View {
    
    @State var pageSelected = 0

    var body: some View {
        
        TabView(selection: $pageSelected) {
            ContentView()
                .tabItem {
                    Image(systemName: "house").font(.system(size: 18))
            }.tag(0)
            CreateRecipe()
                .tabItem {
                    Image(systemName: "plus.circle").font(.system(size: 18))
            }.tag(2)
            About()
                .tabItem {
                    Image(systemName: "slider.horizontal.3").font(.system(size:     18))
            }.tag(3)
        } .accentColor(Color(red: 0.941, green: 0.502, blue: 0.447))
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
