//
//  CreateRecipe.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI
import CoreData

struct CreateRecipe: View {
    
    init() {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        UITableView.appearance().backgroundColor = UIColor(named: "whiteDark")
    }
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: RecipesItem.getAllRecipesItems()) var recipeItems:FetchedResults<RecipesItem>
    @EnvironmentObject var itemData: Observable
    @State private var newRecipeItem = ""
    @State var titleWritten = ""
    @State var index = 0
    @State var ingredientsList:[String] = []
    @State var ingredient = ""
    @State var stepsList:[String] = []
    @State var step = ""
    var categories = ["Petit-déjeuner", "Entrée", "Plat", "Dessert", "En-cas", "Apéritif", "Boisson"]
    
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
                        self.itemData.addData(id: UUID(), title: self.titleWritten, category: self.categories[self.index], ingredient:self.ingredientsList, steps: self.stepsList)
                        
//                        let recipeObject = RecipesItem(context: self.managedObjectContext)
//                        recipeObject.id = UUID()
//                        recipeObject.title = self.titleWritten
//                        recipeObject.category = self.categories[self.index]
//                        recipeObject.ingredients = self.ingredientsList
//                        recipeObject.steps = self.stepsList
//
//                        do {
//                            try self.managedObjectContext.save()
//                        } catch {
//                            print(error)
//                        }
                        
                    }
                    .padding(.top, 10)
                }
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
