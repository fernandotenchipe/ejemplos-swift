import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    func formateNumero(numDouble: Double) -> String{
        let numeroEnString = String(format: "%.2f", numDouble)
    
        return numeroEnString
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .foregroundStyle(.background)
                    .bold()
                
                // Imagen del Pokémon
                AsyncImage(url: URL(string: "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/\(String(format: "%03d", pokemon.id)).png")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .padding(.bottom, 20)
                
                Text("Height: \(formateNumero(numDouble:pokemon.height)) m")
                    .foregroundStyle(.white)
                Text("Weight: \(formateNumero(numDouble:pokemon.weight)) kg")
                    .foregroundStyle(.white)
                
                Text("Abilities:")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                ForEach(pokemon.abilities, id: \.ability.name) { ability in
                    Text(ability.ability.name.capitalized)
                        .foregroundStyle(.white)
                }
            }
            .padding()
            
        }
        .offset(y:-40)
        .background(Color(red: 0/255, green: 58/255, blue: 112/255))
        
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(id: 1, name: "bulbasaur", height: 0.7, weight: 6.9, abilities: [Pokemon.Ability(ability: Pokemon.AbilityDetail(name: "overgrow"))]))
    }
}

