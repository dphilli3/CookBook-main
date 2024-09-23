//
//  Ingredient.swift
//  CookBook
//
//  Created by Dakota Phillips on 9/23/24.
//

import Foundation

struct Ingredient: Codable, Comparable {
    let name: String
    let quantity: String
    
    static func <(lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.name < rhs.name
    }
}

extension Ingredient: Identifiable {
    // It is possible to list the same ingredient multiple times, so uuid will act as unique identifier
    // Example of such a case is https://www.themealdb.com/api/json/v1/1/lookup.php?i=52893 for butter (ingredient 3 + 5)
    var id: UUID { UUID() }
}
