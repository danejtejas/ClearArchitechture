//
//  HomeViewModel.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import SwiftUI
@MainActor
class HomeViewModel: ObservableObject {
    
    let getPokemonsUsesCase: GetPokemonsUseCaseProtocol
    
    init(getPokemonsUsesCase: GetPokemonsUseCaseProtocol) {
        self.getPokemonsUsesCase = getPokemonsUsesCase
    }
    
    @Published var pokemons: [PokemonEntryModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage : String = ""
    
    func getPokemons() async  {
        
        defer {
            isLoading = false
        }
        isLoading = true
        do {
            
            let result = try await getPokemonsUsesCase.execute(offset: 1, limit: 10)
            switch result {
            case .success(let pokemo):
                self.pokemons = pokemo
            case .failure(let error):

                errorMessage = error.localizedDescription
            }
        }
        catch{
            errorMessage = error.localizedDescription
        }
        
       
    }
    
    
}
