//
//  HomView.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import SwiftUI

struct HomView: View {
    
    @StateObject var viewModel = HomeViewModel(getPokemonsUsesCase: Injection.shared.provideGetPokemonsUseCase())
    
    var body: some View {
        
        
        NavigationStack {
            List {
            
                
                ForEach(viewModel.pokemons, id: \.id) { pokemon in
                    
                    Text(pokemon.name)
                    
                }}
            .onAppear{
                Task {
                    await viewModel.getPokemons()
                }
            }
        }
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    Rectangle()
                        .opacity(0.5)
                        .foregroundColor(.black)
                    
                    ProgressView()
                        
                }
                
            }
        }
    }
    
}

#Preview {
    HomView()
}
