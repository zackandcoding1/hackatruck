//
//  Desafio03.swift
//  Aula01
//
//  Created by Turma01-8 on 11/03/26.
//

import SwiftUI

struct Desafio03: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Bem vindo, Fulano")
            }
            Image("tinkaton")
                .opacity(0.3)
            VStack {
                Image("raccoonIcon")
            }
        }
    }
}

#Preview {
    Desafio03()
}
