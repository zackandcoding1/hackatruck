//
//  ContentView.swift
//  Aula02
//
//  Created by Turma01-8 on 12/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var distancia: Float = 0
    @State private var tempo: Float = 0
    @State private var velocidadeMedia: Float = 0
    @State private var pokemon: String = ""
    @State private var corDeFundo: Color = .cinzaClaro
    
    var body: some View {
        ZStack {
            corDeFundo
                .ignoresSafeArea()
            VStack {
                Text("Digite a distância (km):")
                TextField("Digite a distância (km):", value: $distancia, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 200, height: 10)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                Text("Digite o tempo (h):")
                TextField("Digite o tempo (h):", value: $tempo, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 200, height: 10)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button("Calcular") {
                    velocidadeMedia = distancia / tempo
                    print(velocidadeMedia)
                    
                    if (velocidadeMedia < 10) {
                        pokemon = "squirtle"
                        corDeFundo = Color("azulClaro")
                    } else if (velocidadeMedia >= 10 && velocidadeMedia <= 29.9) {
                        pokemon = "donphan"
                        corDeFundo = Color("laranjaClaro")
                    } else if (velocidadeMedia >= 30 && velocidadeMedia <= 69.9) {
                        pokemon = "doduo"
                        corDeFundo = Color("vermelhoClaro")
                    } else if (velocidadeMedia >= 70 && velocidadeMedia <= 89.9) {
                        pokemon = "luxray"
                        corDeFundo = Color("amareloClaro")
                    } else if (velocidadeMedia >= 90 && velocidadeMedia <= 130) {
                        pokemon = "liepard"
                        corDeFundo = Color("verdeClaro")
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundStyle(.vermelhoClaro)
                
                if pokemon != "" {
                    Text("\(velocidadeMedia, specifier: "%.2f") km/h")
                        .font(.system(size: 36))
                    Image(pokemon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                }
                
                VStack {
                    HStack {
                        Text("""
                            SQUIRTLE
                            DONPHAN
                            DODUO
                            LUXRAY
                            LIEPARD
                            """
                        )
                        Text("""
                                (0 - 9.9km/h)
                                (10 - 29.9km/h)
                                (30 - 69.9km/h)
                                (70 - 89.9km/h)
                                (90 - 130km/h)
                            """
                        )
                        Text("""
                            🔵 
                            🟤
                            🟠
                            🟡
                            🟢
                            """
                        )
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
