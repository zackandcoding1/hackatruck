//
//  ContentView.swift
//  Aula08
//
//  Created by Turma01-8 on 30/03/26.
//

import SwiftUI
import UIKit
import CoreML
import Vision

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var classificationLabel: String = "Pronto para analisar"
    
    func classifyImage() {
        guard let uiImage = selectedImage,
              let ciImage = CIImage(image: uiImage) else {
            classificationLabel = "Erro ao converter imagem"
            return
        }
        
        do {
            let model = try VNCoreMLModel(
                for: MobileNetV2(configuration: MLModelConfiguration()).model
            )
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        classificationLabel = "Identificando: \(topResult.identifier) (\(String(format: "%.2f", topResult.confidence * 100))%)"
                    }
                } else {
                    DispatchQueue.main.async {
                        classificationLabel = "Nenhum resultado encontrado"
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            
            DispatchQueue.global().async {
                do {
                    try handler.perform([request])
                } catch {
                    DispatchQueue.main.async {
                        classificationLabel = "Erro na classificação: \(error.localizedDescription)"
                    }
                }
            }
            
        } catch {
            classificationLabel = "Falha ao carregar o modelo ML"
        }
    }
    
    var body: some View {
        VStack {
            Text("Classificador de Imagem")
                .font(.title2)
                .bold()
            
            Spacer()
            
            HStack {
                Image("guaxinim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .cornerRadius(12)
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            
            VStack {
                
            }
            Text("Resultado da Análise")
                .bold()
            
            Text(classificationLabel)
            
            Spacer()
            
            Button("Analisar agora") {
                classifyImage()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            selectedImage = UIImage(named: "guaxinim")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGray5))
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
