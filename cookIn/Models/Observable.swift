//
//  Observable.swift
//  cookIn
//
//  Created by Ivann Galic on 10/06/2020.
//  Copyright © 2020 Stod. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class Observable : ObservableObject{
    
    @Published var data = [RecipeModel]()
    
    init() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipesItem")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in res as! [NSManagedObject]{
                
                self.data.append(RecipeModel(id: i.value(forKey: "id") as! UUID, title: i.value(forKey: "title") as! String, category: i.value(forKey: "category") as! String, ingredients: [i.value(forKey: "ingredient")] as! [String], steps: [i.value(forKey: "steps")] as! [String]))
            }
        }
        catch{
            
            print("error")
        }
    }

    func addData(id: UUID, title: String, category: String, ingredient: [String], steps: [String]){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "RecipesItem", into: context)
        entity.setValue(id, forKey: "id")
        entity.setValue(title, forKey: "title")
        entity.setValue(category, forKey: "category")
        entity.setValue(ingredient, forKey: "ingredient")
        entity.setValue(steps, forKey: "steps")
        
        do{
            
            try context.save()
            print("sucess")
            
            data.append(RecipeModel(id: id, title: title, category: category, ingredients: ingredient, steps: steps))
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipesItem")
        do{
                   
                   let res = try context.fetch(req)
                   
                   for i in res as! [NSManagedObject]{
                       
                       if i.objectID == id{
                           
                           try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
                           self.data.remove(atOffsets: indexset)
                       }
                   }
               }
        catch{
            
            print("error")
        }
    }
    
        
}

