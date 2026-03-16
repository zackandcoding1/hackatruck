//
//  Desafio01.swift
//  Aula03
//
//  Created by Turma01-8 on 13/03/26.
//

import SwiftUI

struct Desafio01: View {
    var body: some View {
        TabView {
            Image("pokedexIconLarge")
                .tabItem {
                    Image("pokedexIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            List {
                HStack {
                    Text("Venusaur")
                    Text("Lvl. 56")
                    
                    Spacer()
                    
                    
                    Image("pokemonVenusaur")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                HStack {
                    Text("Gengar")
                    Text("Lvl. 59")
                    
                    Spacer()
                    
                    
                    Image("pokemonGengar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                HStack {
                    Text("Lapras")
                    Text("Lvl. 57")
                    
                    Spacer()
                    
                    Image("pokemonLapras")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                HStack {
                    Text("Alakazam")
                    Text("Lvl. 54")
                    
                    Spacer()
                    
                    
                    Image("pokemonAlakazam")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                HStack {
                    Text("Arcanine")
                    Text("Lvl. 51")
                    
                    Spacer()
                    
                    
                    Image("pokemonArcanine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
            }
                .badge(6)
                .tabItem {
                    Image("pokeballIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            Image("bagIconLarge")
                .tabItem {
                    Image("bagIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            Image("saveIconLarge")
                .tabItem {
                    Image("saveIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
        }
    }
}

#Preview {
    Desafio01()
}
