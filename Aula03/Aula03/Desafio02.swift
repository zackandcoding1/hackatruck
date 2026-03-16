//
//  Desafio02.swift
//  Aula03
//
//  Created by Turma01-8 on 13/03/26.
//

import SwiftUI

struct Desafio02: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("Menu de Cores")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Cores")
                
                HStack {
                    
                    NavigationLink {
                        ColorDetailView(
                            color: .red,
                            icon: "paintbrush.fill",
                            text: "Vermelho"
                        )
                    } label: {
                        ColorButton(color: .red, icon: "paintbrush.fill")
                    }
                    
                    NavigationLink {
                        ColorDetailView(
                            color: .blue,
                            icon: "pencil",
                            text: "Azul"
                        )
                    } label: {
                        ColorButton(color: .blue, icon: "pencil")
                    }
                }
                
                HStack {
                    
                    NavigationLink {
                        ColorDetailView(
                            color: .gray,
                            icon: "paintpalette.fill",
                            text: "Cinza"
                        )
                    } label: {
                        ColorButton(color: .gray, icon: "paintpalette.fill")
                    }
                    
                    NavigationLink {
                        Text("Lista")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        List {
                            Text("Item")
                        }
                    } label: {
                        ColorButton(color: .purple, icon: "list.bullet")
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ColorDetailView: View {
    
    var color: Color
    var icon: String
    var text: String
    
    var body: some View {
        
        ZStack {
            
            color
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                ZStack {
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 220, height: 220)
                    
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .foregroundColor(color)
                }
                
                Text(text)
                    .font(.title)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct ColorButton: View {
    
    var color: Color
    var icon: String
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 120, height: 120)
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Desafio02()
}
