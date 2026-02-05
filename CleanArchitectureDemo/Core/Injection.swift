//
//  Injection.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//


 class Injection {
    
     private init() {}
     
     static let shared = Injection()
     
     func provideGetPokemonsUseCase() -> GetPokemonsUseImpl {
         
         let repo : PokemonRepositoryProtocol = PokemonRepositoryImp(RemoteDataSource: RemoteDataSource.shared)
         return GetPokemonsUseImpl(repo: repo)
     }
}
