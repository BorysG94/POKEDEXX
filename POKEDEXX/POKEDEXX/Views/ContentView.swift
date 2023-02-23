 //
//  ContentView.swift
//  POKEDEXX
//
//  Created by Ola Adamus on 17/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 115))
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 5) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeOut(duration:0.4), value: vm.filteredPokemon.count)
                .navigationTitle("PokemonDex")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
