//
//  RemoteDataSourceProtocol.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import SwiftUI
import Combine

 protocol RemoteDataSourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
    
    
}


struct RemoteDataSource {
    private init() {}
    static let shared = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL: \(urlString)")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw URLError.init(.badServerResponse) }
        
        do{
            print(String(data: data, encoding: .utf8))
           let obj = try JSONDecoder().decode(PokemonResponse.self, from: data)
            return obj
        }catch {
            throw URLError(.cannotParseResponse)
        }
    }
    
        
}
