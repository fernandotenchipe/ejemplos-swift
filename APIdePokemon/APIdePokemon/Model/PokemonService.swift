//
//  PokemonService.swift
//  APIdePokemon
//
//  Created by Alumno on 03/09/24.
//

import Foundation

class PokemonService {
    private let baseURL = "https://pokeapi.co/api/v2/"
    
    func fetchPokemonList(completion: @escaping ([Pokemon]) -> Void) {
        let url = URL(string: "\(baseURL)pokemon?limit=20")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(PokemonListResponse.self, from: data)
                let pokemonUrls = response.results.map { URL(string: $0.url)! }
                self.fetchPokemons(from: pokemonUrls, completion: completion)
            } catch {
                print("Error decoding Pokémon list: \(error)")
            }
        }
        task.resume()
    }
    
    private func fetchPokemons(from urls: [URL], completion: @escaping ([Pokemon]) -> Void) {
        let group = DispatchGroup()
        var pokemons = [Pokemon]()
        
        for url in urls {
            group.enter()
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                defer { group.leave() }
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let pokemon = try decoder.decode(Pokemon.self, from: data)
                    pokemons.append(pokemon)
                } catch {
                    print("Error decoding Pokémon: \(error)")
                }
            }
            task.resume()
        }
        
        group.notify(queue: .main) {
            completion(pokemons)
        }
    }
}
