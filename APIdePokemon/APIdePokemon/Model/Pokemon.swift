//
//  Pokemon.swift
//  APIdePokemon
//
//  Created by Alumno on 03/09/24.
//

import Foundation

struct Pokemon: Identifiable, Codable {
    let id: Int
    let name: String
    let height: Double
    let weight: Double
    let abilities: [Ability]
    
    
    struct Ability: Codable {
        let ability: AbilityDetail
    }
    
    struct AbilityDetail: Codable {
        let name: String
    }
}
