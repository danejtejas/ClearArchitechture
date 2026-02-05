//
//  PokemonEntryModel.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//
import Foundation
struct PokemonEntryModel {
    
    var id : UUID = .init()
    let name : String
    let url : String
    
    var image :String {
        return ""
    }
    
}

extension PokemonEntryModel : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PokemonEntryModel, rhs: PokemonEntryModel) -> Bool {
        return lhs.id == rhs.id
    }
}
