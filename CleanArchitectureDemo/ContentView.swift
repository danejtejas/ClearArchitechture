//
//  ContentView.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @State private var output: String = "encript mess"
    var body: some View {
        VStack {
            TextField("Enter text", text: $text)
            
            Button("Encript", action: en)
            
            
            Text(output)
            
        
        }
        .padding()
    }
    
    func en() {
        let helper = SecurityHelper()
        do {
            let data  = try helper.encrypt(text)
            
            output = String(data: data, encoding: .utf8) ?? ""
            print(output)
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}

#Preview {
    ContentView()
}
