//
//  Recette.swift
//  Cook'in
//
//  Created by Ivann Galic on 05/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//
import Foundation
import CoreData

public class RecipeModel: ObservableObject, Identifiable, Decodable, Hashable {
    public static func == (lhs: RecipeModel, rhs: RecipeModel) -> Bool {
        return lhs.title == rhs.title && lhs.category == rhs.category && lhs.ingredients == rhs.ingredients && lhs.steps == rhs.steps
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(category)
        hasher.combine(ingredients)
        hasher.combine(steps)
    }
    
    public var id: UUID
    var title: String
    var category: String
    var ingredients: String
    var steps: String
    
    init(id: UUID, title: String, category: String, ingredients: String, steps: String) {
        self.id = id
        self.title = title
        self.category = category
        self.ingredients = ingredients
        self.steps = steps
    }
}
