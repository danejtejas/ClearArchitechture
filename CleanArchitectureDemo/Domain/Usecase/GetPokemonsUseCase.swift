//
//  GetPokemonsUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//


import SwiftUI

 protocol GetPokemonsUseCaseProtocol {
    func  execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error>
}


struct GetPokemonsUseImpl: GetPokemonsUseCaseProtocol{
     let repo:  PokemonRepositoryProtocol
    
    init(repo: PokemonRepositoryProtocol) {
        self.repo = repo
    }
    
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error> {
        do {
            let pokemons = try await repo.getPokemons(offset: offset, limit: limit)
            return .success(pokemons)
        } catch {
            return .failure(error)
        }
    }
}
