//
//  ContentView.swift
//  Cook'in
//
//  Created by Kevin on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    HStack {
                        Image("bandeau")
                            .resizable()
                            .frame(height: 160, alignment: .center)
                    }
                    HStack {
                        Text("Bienvenue")
                            .font(.custom("Michella Garden", size: 95
                                ))
                            .shadow(radius: 10)
                            .padding()
                            .foregroundColor(.white)
                    }.zIndex(1)
                }
                Spacer()
                VStack {
                    NavigationLink(destination: CreateRecipe()){
                        Image("notebook_rond")
                            .resizable()
                            .frame(width: 110, height: 110, alignment: .center)
                            .clipShape(Circle())
                    }
                    Text("Créer une recette")
                        .bold()
                }
                .padding(.bottom, 40)
                
                VStack {
                    NavigationLink(destination: MyRecipes()) {
                        Image("pancakes_rond")
                            .resizable()
                            .frame(width: 110, height: 110, alignment: .center)
                            .clipShape(Circle())
                    }
                    Text("Mes recettes")
                        .bold()
                }
                Spacer()
            }
                //.navigationBarHidden(true)
                .navigationBarTitle(
                    Text("Home")
                    , displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 70, alignment: .center)
                            .padding(UIScreen.main.bounds.size.width/4+50)
                            .padding(.bottom, 10)
                    }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
