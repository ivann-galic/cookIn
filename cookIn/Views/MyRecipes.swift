//
//  MyRecipes.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI

struct MyRecipes: View {
    
    @ObservedObject var datas = JsonRequest()
    
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
                    ForEach(datas.json) { item in
                        NavigationLink(destination: Recipe(jsonItem: item)) {
                            VStack {
                                Text(item.title)
                                    .foregroundColor(.black)
                                Text(item.category)
                                    .foregroundColor(.gray)
                                    .padding(.leading, -2)
                            }
                            
                        }
                    }
                    .onDelete { (indexSet) in
                        if let index = indexSet.first {
                            self.datas.json.remove(at: index)
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
