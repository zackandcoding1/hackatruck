//
//  ContentView.swift
//  Aula06
//
//  Created by Turma01-8 on 23/03/26.
//

import SwiftUI
import Translation

struct MenuCategory: Hashable {
    let title: String
    let items: [MenuItem]
}

struct MenuItem: Hashable {
    let name: String
    let price: Double
    let image: String
}

struct MenuView: View {
    
    @State private var arrayCategorias: [MenuCategory] = [
        MenuCategory(title: "Entrada", items: [
            MenuItem(name: "Canapés de Camarão", price: 32, image: "canapeCamarao"),
            MenuItem(name: "Carolinas de frango", price: 35, image: "carolinaFrango"),
            MenuItem(name: "Quiches de espinafre", price: 35, image: "quicheEspinafre")
        ]),
        MenuCategory(title: "Principal", items: [
            MenuItem(name: "Risoto de Camarão", price: 72, image: "risotoCamarao"),
            MenuItem(name: "Tortellini de queijo", price: 69, image: "tortelliniQueijo"),
            MenuItem(name: "Bisteca com batatas", price: 58, image: "bisteca")
        ]),
        MenuCategory(title: "Sobremesa", items: [
            MenuItem(name: "Pudim de leite condesado", price: 35, image: "pudim"),
            MenuItem(name: "Brownie de chocolate amargo", price: 32, image: "brownie"),
            MenuItem(name: "Torta de negresco", price: 39, image: "tortaNegresco")
        ]),
        MenuCategory(title: "Bebida", items: [
            MenuItem(name: "Mojito", price: 29, image: "mojito"),
            MenuItem(name: "Suco de abacaxi", price: 15, image: "sucoAbacaxi"),
            MenuItem(name: "Chá de hibisco", price: 19, image: "chaHibisco")
        ])
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Hackatruck GastroBar")
                    .font(.title)
                    .bold()
                VStack {
                    ForEach(arrayCategorias, id: \.self) { category in
                        CategoryComponentView(category: category)
                        Divider()
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

struct CategoryComponentView: View {
    @State private var showTranslation = false
    @State private var textToTranslate = ""
    
    let category: MenuCategory
    
    var body: some View {
        ScrollView {
            
        }
        VStack(alignment: .leading) {
            
            Text(category.title)
                .font(.headline)
            
            ForEach(category.items, id: \.self) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                        .cornerRadius(4)
                    
                    Text(item.name)
                    
                    Spacer()
                    
                    Text(String(format: "R$ %.2f", item.price))
                    
                    Button {
                        textToTranslate = item.name
                        showTranslation = true
                    } label: {
                        Image(systemName: "translate")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .translationPresentation(isPresented: $showTranslation, text: textToTranslate)
    }
}

#Preview {
    MenuView()
}
