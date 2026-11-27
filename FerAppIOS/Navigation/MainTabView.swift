import SwiftUI

struct MainTabView: View {
    enum Pestana: Hashable { case inicio, guardados, preferencias, ajustes }

    @Environment(AppViewModel.self) private var viewModel
    @State private var seleccion: Pestana = .inicio
    @State private var mostrandoPreferencias = false

    var body: some View {
        TabView(selection: $seleccion) {
            FeedScreen()
                .tabItem { Label("Inicio", systemImage: "house") }
                .tag(Pestana.inicio)

            GuardadosScreen()
                .tabItem { Label("Guardados", systemImage: "star") }
                .tag(Pestana.guardados)

            Color.clear
                .tabItem { Label("Preferencias", systemImage: "slider.horizontal.3") }
                .tag(Pestana.preferencias)

            ConfiguracionScreen()
                .tabItem { Label("Ajustes", systemImage: "gearshape") }
                .tag(Pestana.ajustes)
        }
        .tint(.ferAzul)
        .onChange(of: seleccion) { anterior, nueva in
            if nueva == .preferencias {
                seleccion = anterior  
                mostrandoPreferencias = true
            }
        }
        .fullScreenCover(isPresented: $mostrandoPreferencias) {
            FlujoPreferencias(
                perfil: viewModel.perfil,
                onCancelar: { mostrandoPreferencias = false },
                onFinalizar: { nuevo in
                    viewModel.perfil = nuevo
                    mostrandoPreferencias = false
                }
            )
        }
    }
}
