//
//  TamanoTextoScreen.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct TamanoTextoScreen: View {
    @State private var chico = false
    @State private var mediano = true
    @State private var grande = false
    
    var body: some View {
        NavigationStack {
            Text("Tamaño de texto")
                .multilineTextAlignment(.center)
                .bold()
                .font(.largeTitle)
                .padding()
            ScrollView {
                VStack(spacing: 16) {
                    HStack() {
                        VStack {
                            Text("Tamaño chico")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .font(.title2)
                            Text("Elegir un tamaño de texto más pequeño")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.body)
                        }
                        Button {
                            chico.toggle()
                        } label: {
                            Image(systemName: chico ? "largecircle.fill.circle" : "circle")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                    Divider()
                    HStack() {
                        VStack {
                            Text("Tamaño mediano")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .font(.title2)
                            Text("Elegir el tamaño de texto recomendado")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.body)
                        }
                        Button {
                            mediano.toggle()
                        } label: {
                            Image(systemName: mediano ? "largecircle.fill.circle" : "circle")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                    Divider()
                    HStack() {
                        VStack {
                            Text("Tamaño grande")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .font(.title2)
                            Text("Elegir un tamaño de texto más grande")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.body)
                        }
                        Button {
                            grande.toggle()
                        } label: {
                            Image(systemName: grande ? "largecircle.fill.circle" : "circle")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                    Divider()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
    }
}

#Preview {
    TamanoTextoScreen()
}
