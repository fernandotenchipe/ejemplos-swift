//
//  PokemonListResponse.swift
//  APIdePokemon
//
//  Created by Alumno on 03/09/24.
//

import Foundation

struct PokemonListResponse: Codable {
    let results: [PokemonSummary]
    
    struct PokemonSummary: Codable {
        let name: String
        let url: String
    }
}
