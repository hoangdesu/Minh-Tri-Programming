//
//  Fruit.swift
//  hello-ios
//
//  Created by Brian on 05/04/2026.
//

import Foundation

struct Fruit: Decodable {
    let id: Int?
    let name: String?
}

//{
//    "name": "Persimmon",
//    "id": 52,
//    "family": "Ebenaceae",
//    "order": "Rosales",
//    "genus": "Diospyros",
//    "nutritions": {
//      "calories": 81,
//      "fat": 0,
//      "sugar": 18,
//      "carbohydrates": 18,
//      "protein": 0
//    }
//},
