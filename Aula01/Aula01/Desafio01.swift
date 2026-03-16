//
//  ContentView.swift
//  Aula01
//
//  Created by Turma01-8 on 11/03/26.
//

import SwiftUI

struct Desafio01: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .position(x: 50, y: 30)
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .position(x: 320, y: -160)
            Rectangle()
                .fill(.green)
                .frame(width: 100, height: 100)
                .position(x: 50, y: 330)
            Rectangle()
                .fill(.yellow)
                .frame(width: 100, height: 100)
                .position(x: 320, y: 140)
            
        }
        .padding()
    }
}

#Preview {
    Desafio01()
}
