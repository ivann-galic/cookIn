//
//  Recipe.swift
//  cookIn
//
//  Created by Ivann Galic on 08/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//
import SwiftUI

struct Recipe: View {
    
    @State var item: RecipeModel
    
    var body: some View {
        VStack {
            VStack {
                Text(self.item.title)
                    .font(.title)
                    .padding(.bottom, 10)
                    .padding(.top, 20)
            }
            
            VStack {
                Text(self.item.category)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .background(/*@START_MENU_TOKEN@*/Color(red: 0.937, green: 0.498, blue: 0.447)/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 15)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Ingrédients")
                            .font(.title)
                            .padding(.leading, 20)
                            .padding(.top, 5)
                        Spacer()
                    }
                    HStack {
                        VStack {
                            ForEach(self.item.ingredients, id: \.self) { ingredient in
                                HStack {
                                    Image(systemName: "circle.fill").font(.system(size: 7))
                                        .padding(.leading, 20)
                                    Text(ingredient)
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    HStack {
                        Text("Etapes")
                            .font(.title)
                            .padding(.bottom, 20)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    HStack {
                        VStack {
                            ForEach(self.item.steps, id: \.self) { step in
                                HStack {
                                    Text(step)
                                        .padding(.leading, 20)
                                        .padding(.bottom, 10)
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width)
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct Recipe_Previews: PreviewProvider {
    
    @State var jsonItem: RecipeModel
    
    static var previews: some View {
        Recipe(item: RecipeModel(id: UUID(),title: "Pancakes", category: "catégorie", ingredients: ["bla", "blou"], steps: ["1", "2"]))
    }
}
