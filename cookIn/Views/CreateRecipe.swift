//
//  CreateRecipe.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI

struct CreateRecipe: View {
    
    init() {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        
                UITableView.appearance().backgroundColor = UIColor(named: "whiteDark")
    }
    
    @State private var newRecipeItem = ""
    
    @State var titleWritten = ""
    @State var index = 0
    var categories = ["Petit-déjeuner", "Entrée", "Plat", "Dessert", "En-cas", "Apéritif", "Boisson"]
    @State var ingredientsList:[String] = []
    @State var ingredient = ""
    @State var stepsList:[String] = []
    @State var step = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Créer une recette")
                            .font(.title)
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        
                        Spacer()
                    }
                    TextField("Titre de la recette", text: $titleWritten, onEditingChanged: { (sucess) in
                        print("On Editing: \(sucess)")
                    }) {
                        print("On commit")
                    }
                    Picker(selection: $index, label: Text("Catégorie")){
                        ForEach(0..<categories.count) { x in
                            Text(self.categories[x]).tag(x)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        TextField("Ingrédient", text: self.$ingredient)
                        Button(action: addIngredient) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                        }
                        
                    }
                    List {
                        ForEach(ingredientsList, id: \.self) {
                            Text($0)
                        }
                    }
                    HStack {
                        TextField("Etape", text: self.$step)
                            .padding(.top, 10)
                        Button(action: addStep) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.yellow)
                                .imageScale(.large)
                        }
                    }
                    List {
                        ForEach(ingredientsList, id: \.self) {
                            Text($0)
                        }
                        .padding(.bottom, 10)
                    }
                    Button("Enregistrer") {
                        /*
                         let recipeArray = ["title" : self.titleWritten, "category" : self.categories[self.index], "ingredients" : self.ingredientsList, "steps": self.stepsList] as [String : Any]
                         
                         do {
                         let fileURL = try FileManager.default
                         .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                         .appendingPathComponent("example.json")
                         try JSONSerialization.data(withJSONObject: recipeArray)
                         .write(to: fileURL)
                         print(fileURL)
                         } catch {
                         print(error)
                         }*/
                        
                        
                        
                        
                        
                        /*
                         guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                         
                         let fileUrl = documentDirectoryUrl.appendingPathComponent("Recipes.json")
                         
                         let recipeArray = ["title" : self.titleWritten, "category" : self.categories[self.index], "ingredients" : self.ingredientsList, "steps": self.stepsList] as [String : Any]
                         let encoder = JSONEncoder()
                         
                         let data = try! encoder.encode([RecipeModel].self, from: data)
                         print(data)
                         
                         print(recipeArray)*/
                        
                        /*
                         let recipe = RecipeModel(title: self.titleWritten, category: self.categories[self.index], ingredients: self.ingredientsList, steps: self.stepsList)
                         let encoder = JSONEncoder()
                         
                         let data = try! encoder.encode(recipe)
                         print(data)*/
                        
                        
                    }
                    .padding(.top, 10)
                }
                
                
                //Display a list of ingredients in the ingredientsList after the user clicks on the button.
                
                
            }
        }
    }
    
    func addIngredient() {
        guard self.ingredient != "" else {return}
        let new = self.ingredient
        
        self.ingredientsList.append(new)
        print(self.ingredientsList)
        
        
        self.ingredient = ""
    }
    
    func addStep() {
        guard self.step != "" else {return}
        let new = self.step
        
        self.stepsList.append(new)
        print(self.stepsList)
        
        
        self.step = ""
    }
    
    
}

struct CreateRecipe_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipe()
    }
}
