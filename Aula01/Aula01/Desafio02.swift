//
//  Desafio02.swift
//  Aula01
//
//  Created by Turma01-8 on 11/03/26.
//

import SwiftUI

struct Desafio02: View {
    var body: some View {
        HStack {
            Image("raccoonIcon")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack {
                Text("Hackatruck")
                    .foregroundStyle(.orange)
                Text("77 Universidades")
                    .foregroundStyle(.blue)
                Text("5 regiões do Brasil")
                    .foregroundStyle(.yellow)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    Desafio02()
}
