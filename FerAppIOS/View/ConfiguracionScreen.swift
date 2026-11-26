//
//  ConfiguracionScreen.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct ConfiguracionScreen: View {
    @State private var switchNotificaciones: Bool = true
    @State private var switchModoOscuro: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Configuración")
                .multilineTextAlignment(.center)
                .bold()
                .font(.largeTitle)
                .padding()
            ScrollView {
                VStack(spacing: 16) {
                    Text("Accesibilidad")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .font(.title)
                        .padding(.bottom, 20)
                    HStack() {
                        VStack {
                            Text("Modo oscuro")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .font(.title2)
                            Text("Activar modo oscuro")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.body)
                        }
                        Toggle("", isOn: $switchModoOscuro)
                            .labelsHidden()
                            .tint(.blue)
                    }
                    Divider()
                    NavigationLink {
                        TamanoTextoScreen()
                    } label: {
                        HStack {
                            VStack {
                                Text("Tamaño de texto")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .font(.title2)
                                Text("Modificar el tamaño de texto")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.body)
                            }
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.primary)
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text("Lector de Pantalla")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .font(.title2)
                            Text("Activar el lector de pantalla")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.body)
                        }
                        Image(systemName: "chevron.right")
                    }
                    Divider()
                    Text("Privacidad")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    NavigationLink {
                        PermisosScreen()
                    } label: {
                        HStack {
                            VStack {
                                Text("Permisos")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .font(.title2)
                                Text("Modificar los permisos de la app")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.body)
                            }
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.primary)
                    }
                    Divider()
                    Text("Ayuda")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    Text("Reportar un problema")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.body)
                        .underline()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
    }
}

#Preview {
    ConfiguracionScreen()
}
