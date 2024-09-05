import SwiftUI

struct ContentView: View {
    @State private var pokemons = [Pokemon]()
    @State private var selectedPokemon: Pokemon?
    
    private let pokemonService = PokemonService()
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    HStack {
                        AsyncImage(url: URL(string: "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/\(String(format: "%03d", pokemon.id)).png")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80) // Ajusta el tamaño según tus necesidades
                        } placeholder: {
                            ProgressView()
                                .frame(width: 80, height: 80) // Mismo tamaño que la imagen
                        }
                        
                        Text(pokemon.name.capitalized)
                            .font(.headline)
                            .padding(.leading, 10)
                    }
                    .padding()
                }
            }
            .onAppear(perform: loadPokemons)
            .navigationTitle("Pokemon List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Developed by Fernando Tenchipe  A01571277")
                        .font(.subheadline)
                    
                }
            }
        }
    }
    
    private func loadPokemons() {
        pokemonService.fetchPokemonList { fetchedPokemons in
            self.pokemons = fetchedPokemons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
