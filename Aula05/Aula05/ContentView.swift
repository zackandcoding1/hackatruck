//
//  ContentView.swift
//  Aula05
//
//  Created by Turma01-8 on 18/03/26.
//

import SwiftUI
import MapKit

struct MaravilhasDoMundo: Hashable {
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    @State private var selectedLocation: MaravilhasDoMundo?
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    )
    
    let locations = [
        MaravilhasDoMundo(
            nome: "Cristo Redentor",
            foto: "https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg",
            descricao: "Cristo Redentor é uma estátua que retrata Jesus Cristo localizada no topo do morro do Corcovado, a 709 metros acima do nível do mar, dentro do Parque Nacional da Tijuca. Tem vista para parte considerável da cidade brasileira do Rio de Janeiro, sendo a frente da estátua voltada para a Baía de Guanabara e as costas para a Floresta da Tijuca.",
            latitude: -22.9520561,
            longitude: -43.2105388)
    ]
    
    var body: some View {
        ZStack (alignment: .top) {
            VStack {
                Map(position: $position)
                    .ignoresSafeArea()
            }
            VStack (alignment: .leading){
                Picker("Selecione um local", selection: $selectedLocation) {
                    Text("Selecione um local").tag(nil as MaravilhasDoMundo?)
                    
                    ForEach(locations, id: \.self) {
                        local in Text(local.nome)
                            .tag(Optional(local))
                    }
                }
                .background(.yellow)
                .padding()
                .tint(.black)
            }
            VStack() {
                Spacer()
                
                Text("Maravilhas do Mundo Moderno")
                    .background(.yellow)
                    .frame(height: 50)
                    .cornerRadius(24)
            }
        }
    }
}

struct detalharLocalView: View {
    var local: MaravilhasDoMundo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: local.foto)) { image in image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(24)
                    .frame(height: 300)
            } placeholder: {
                ProgressView()
            }
            Text(local.nome)
                .font(.largeTitle)
            Text(local.descricao)
                .background(.brown)
        }
    }
}

#Preview {
    ContentView()
}
