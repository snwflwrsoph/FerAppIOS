
import SwiftUI
import UIKit

struct ConfiguracionScreen: View {
    @State private var path: [AjustesRoute] = []
    @State private var mostrandoAvisoLectorPantalla = false

    @Environment(AppViewModel.self) private var viewModel
    @Environment(\.openURL) private var openURL

    private var modoOscuro: Binding<Bool> {
        Binding(
            get: { viewModel.modoOscuro },
            set: { viewModel.cambiarModoOscuro($0) }
        )
    }

    private func abrirAjustesDelSistema() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            openURL(url)
        }
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
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
                            Toggle("Modo oscuro", isOn: modoOscuro)
                                .labelsHidden()
                                .tint(.blue)
                        }
                        Divider()
                        Button {
                            path.append(.tamanoTexto)
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
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        Divider()
                        Button {
                            mostrandoAvisoLectorPantalla = true
                        } label: {
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
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        Divider()
                        Text("Privacidad")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.title)
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        Button {
                            path.append(.permisos)
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
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
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
            .foregroundStyle(Color.ferOnSurface)
            .background(Color.ferBackground.ignoresSafeArea())
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: AjustesRoute.self) { ruta in
                switch ruta {
                case .tamanoTexto:
                    TamanoTextoScreen(
                        seleccion: viewModel.tamanoTexto,
                        onSeleccionChange: { viewModel.cambiarTamanoTexto($0) }
                    )
                case .permisos:
                    PermisosScreen()
                }
            }
            .alert("Lector de pantalla", isPresented: $mostrandoAvisoLectorPantalla) {
                Button("Abrir Ajustes") { abrirAjustesDelSistema() }
                Button("Entendido", role: .cancel) { }
            } message: {
                Text("iOS solo permite activar el lector de pantalla (VoiceOver) desde Ajustes > Accesibilidad > VoiceOver. También puedes decirle a Siri: “Activa VoiceOver”.")
            }
        }
    }
}

#Preview {
    ConfiguracionScreen()
        .environment(AppViewModel(perfil: PerfilUsuario()))
}
