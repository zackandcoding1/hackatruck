//
//  ContentView.swift
//  Aula07
//
//  Created by Turma01-8 on 26/03/26.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    let model = GenerativeModel(name: "gemini-2.5-flash", apiKey: "GEMINI_API_KEY")
    
    @State private var chat: Chat?
    @State private var textInput = ""
    @State private var aiResponse = "Olá! Como posso ajudar você hoje?"
    
    func sendMessage() {
        
        guard let chat = chat else { return }
        
        aiResponse = "Pensando..."
        
        Task {
            do {
                let prompt = """
                Você é um professor de inglês. O estudante escreveu \(textInput)
                
                1. Traduza a frase para inglês
                2. Explique a frase brevemente
                3. Dê um exemplo semelhante.
                
                Responda de uma forma simples.
                """
                
                let response = try await chat.sendMessage(prompt)
                
                guard let text = response.text else {
                    textInput = "Desculpe, não consegui processar isso.\nPor favor, tente novamente."
                    return
                }
                
                textInput = ""
                aiResponse = text
            } catch {
                aiResponse = "Algo deu errado!\n\(error.localizedDescription)"
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("TraduzAI")
                .font(.title)
                .padding()
            
            ScrollView {
                Text(aiResponse)
                    .padding()
            }
            
            Spacer()
            
            HStack {
                TextField("Escreva algo...", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Enviar") {
                    sendMessage()
                }
            }
                .padding()
        }
        .onAppear {
            chat = model.startChat()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
