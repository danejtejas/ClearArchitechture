//
//  PokemonRepositoryProtocal.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import SwiftUI
import Combine

 protocol PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
    
    
}


struct PokemonRepositoryImp {
    
    fileprivate var remoteDataSource: RemoteDataSource
    init(RemoteDataSource: RemoteDataSource) {
        self.remoteDataSource = RemoteDataSource
    }
    
    
}
    
        

extension PokemonRepositoryImp: PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel] {
        let response =  try await remoteDataSource.getPokemons(offset: offset, limit: limit)
        return PokemonMapper.map(from: response.results)
    }
    
    
}

enum PokemonMapper   {
    static func map(from response: [PokemonEntryResponse]) -> [PokemonEntryModel] {
      return  response.map { pk in
          PokemonEntryModel(name: pk.name ?? "", url: pk.url ?? "")
        }
    }
}
