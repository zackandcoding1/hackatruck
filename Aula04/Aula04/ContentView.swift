//
//  ContentView.swift
//  Aula04
//
//  Created by Turma01-8 on 16/03/26.
//

import SwiftUI

struct Conteudo: Hashable {
    let categoria: String
    let nome: String
    let capa: String
    let ano: String
    let genero: String
    let pais: String
    let imdb: Double
}

struct ContentView: View {
    
    @State var arrayConteudos: [Conteudo] = [
        Conteudo(categoria: "Filme", nome: "Guardiões da Galáxia Vol. 3", capa: "https://a.ltrbxd.com/resized/film-poster/3/7/9/7/1/1/379711-guardians-of-the-galaxy-volume-3-0-2000-0-3000-crop.jpg", ano: "2023", genero: "Ação", pais: "🇺🇸", imdb: 7.9),
        Conteudo(categoria: "Filme", nome: "Sussurros do Coração", capa: "https://a.ltrbxd.com/resized/film-poster/2/6/7/1/3/26713-whisper-of-the-heart-0-2000-0-3000-crop.jpg", ano: "1995", genero: "Drama", pais: "🇯🇵", imdb: 7.8),
        Conteudo(categoria: "Filme", nome: "Tudo Sobre Lily Chou-Chou", capa: "https://a.ltrbxd.com/resized/film-poster/4/1/4/4/7/41447-all-about-lily-chou-chou-0-2000-0-3000-crop.jpg", ano: "2001", genero: "Drama", pais: "🇯🇵", imdb: 7.5),
        Conteudo(categoria: "Filme", nome: "Memórias de um Assassino", capa: "https://a.ltrbxd.com/resized/sm/upload/84/xt/e8/mw/gawnVe9cFowdoDLo9Pok12NTw39-0-2000-0-3000-crop.jpg", ano: "2003", genero: "Suspense", pais: "🇰🇷", imdb: 8.1),
        Conteudo(categoria: "Filme", nome: "A História de Shimotsuma", capa: "https://a.ltrbxd.com/resized/film-poster/3/5/4/4/3/35443-kamikaze-girls-0-2000-0-3000-crop.jpg", ano: "2004", genero: "Comédia", pais: "🇯🇵", imdb: 7.2),
        Conteudo(categoria: "Série", nome: "The Office", capa: "https://m.media-amazon.com/images/M/MV5BZjQwYzBlYzUtZjhhOS00ZDQ0LWE0NzAtYTk4MjgzZTNkZWEzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg", ano: "2005", genero: "Comédia", pais: "🇺🇸", imdb: 9.0),
        Conteudo(categoria: "Série", nome: "Família Soprano", capa: "https://m.media-amazon.com/images/M/MV5BMjRmMTNiMTQtMDg1ZS00MGM1LWE1MGUtYjEzMGFjNWUzOWRkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg", ano: "1999", genero: "Crime", pais: "🇺🇸", imdb: 9.2),
        Conteudo(categoria: "Série", nome: "Supernatural", capa: "https://m.media-amazon.com/images/M/MV5BMzJhNDk0MGUtMWI0YS00ZGFmLWE3OTktZTMwNjhlZjExNWZhXkEyXkFqcGc@._V1_.jpg", ano: "2005", genero: "Mistério", pais: "🇺🇸", imdb: 8.4),
    ]
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        Section(header: Text("Filmes")) {
                            ForEach(arrayConteudos.filter { $0.categoria == "Filme" }, id: \.self) { filme in
                                NavigationLink(destination: DetalhesView(filme: filme)) {
                                    HStack {
                                        AsyncImage(url: URL(string: filme.capa)) { image in image
                                                .resizable()
                                                .scaledToFit()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(height: 80)
                                        VStack (alignment: .leading) {
                                            Text(filme.nome)
                                                .font(.headline)
                                            Text(filme.ano)
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                        Text(filme.pais)
                                    }
                                }
                            }
                        }
                        
                        Section(header: Text("Séries")) {
                            ForEach(arrayConteudos.filter { $0.categoria == "Série" }, id: \.self) { serie in
                                NavigationLink(destination: DetalhesView(filme: serie)) {
                                    HStack {
                                        AsyncImage(url: URL(string: serie.capa)) { image in image
                                                .resizable()
                                                .scaledToFit()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(height: 80)
                                        VStack (alignment: .leading ) {
                                            Text(serie.nome)
                                                .font(.headline)
                                            Text(serie.ano)
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                        Text(serie.pais)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                }
        }
        }
}

struct DetalhesView: View {
    var filme: Conteudo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: filme.capa)) { image in image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(24)
                    .frame(height: 400)
            } placeholder: {
                ProgressView()
            }
            Text(filme.nome)
                .font(.custom("Georgia", size: 24))
                .padding()
            VStack {
                Text("\(Text("Categoria: ").bold())\(Text(filme.categoria))")
                Text("\(Text("Ano: ").bold())\(Text(filme.ano))")
                Text("\(Text("Gênero: ").bold())\(Text(filme.genero))")
                Text("\(Text("País: ").bold())\(Text(filme.pais))")
                Text("IMDb: \(String(format: "%.2f", filme.imdb))")
                    .font(.largeTitle)
                    .background(.black)
                    .cornerRadius(12)
                    .padding()
            }
            .foregroundStyle(.yellow)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
