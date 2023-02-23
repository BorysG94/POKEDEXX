//
//  PokemonView.swift
//  POKEDEXX
//
//  Created by Ola Adamus on 17/02/2023.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 120
    let colors: [String: Color] = ["n": .yellow]
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.ultraThickMaterial)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(.yellow, lineWidth: 3))
            
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 18, weight: . regular, design: .monospaced))
                .padding(.bottom, 20)
                
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
