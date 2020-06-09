//
//  JsonRequest.swift
//  cookIn
//
//  Created by Ivann Galic on 04/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import Foundation
import SwiftUI

class JsonRequest: ObservableObject {
    @Published var json = [RecipeModel]()
    
    init() {
        load()
        // To remove only extra list separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all list separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "Recipes", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([RecipeModel].self, from: data)
                    
                    DispatchQueue.main.sync {
                        self.json = json
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
