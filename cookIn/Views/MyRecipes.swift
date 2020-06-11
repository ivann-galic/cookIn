//
//  MyRecipes.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI
import CoreData

struct MyRecipes: View {
    
    @EnvironmentObject var itemData: Observable
    
    var body: some View {
        VStack {
            HStack {
                Text("Mes recettes")
                    .font(.title)
                    .padding(.top, 20)
                    .padding(.leading, 15)
                Spacer()
            }
            VStack {
                List {
                    ForEach(self.itemData.data) { i in
                        NavigationLink(destination: Recipe(item: i)) {
                            VStack {
                                Text(i.title)
                                .padding(.leading, -25)
                                Text(i.category)
                                    .foregroundColor(.gray)
                                    .padding(.leading, -2)
                            }
                        }
                    }
                    .onDelete { (indexSet) in
                        if let index = indexSet.first {
                            self.itemData.data.remove(at: index)
                        }
                    }
                }
            }
        }
    }
}

struct MyRecipes_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipes()
    }
}
