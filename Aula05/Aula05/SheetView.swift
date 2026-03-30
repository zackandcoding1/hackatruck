//
//  SheetView.swift
//  Aula05
//
//  Created by Turma01-8 on 18/03/26.
//

import SwiftUI

struct SheetView: View {
    @Binding var objeto: MaravilhasDoMundo
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Text(objeto.nome)
        }
        .sheet(isPresented: $showSheet) {
            SheetView(objeto: $objeto)
        }
    }
}
