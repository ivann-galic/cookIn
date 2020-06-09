//
//  RecipesItem.swift
//  cookIn
//
//  Created by Kevin on 06/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//
import Foundation
import CoreData

public class RecipesItem:NSManagedObject, Identifiable {
    @NSManaged public var id:Date?
    @NSManaged public var title:String?
    @NSManaged public var category:String?
    /*@NSManaged public var ingredients:String?
     @NSManaged public var steps:String?*/
}

extension RecipesItem {
    static func getAllRecipesItems() -> NSFetchRequest<RecipesItem> {
        let request:NSFetchRequest<RecipesItem> = RecipesItem.fetchRequest() as! NSFetchRequest<RecipesItem>
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
