//
//  PokemonResponse.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]
}

struct PokemonEntryResponse: Decodable {
    let name : String?
    let url: String?
    
}
