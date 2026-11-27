import SwiftUI
struct GuardadosScreen: View {
    @Environment(AppViewModel.self) private var viewModel
    @State private var path: [FeedRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.saved.isEmpty {
                    Text("Aún no has guardado anuncios.\nToca la estrella de un anuncio para guardarlo.")
                        .font(.subheadline)
                        .foregroundColor(.ferMuted)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Guardados")
                                .font(.title2.bold())
                                .foregroundColor(.ferAzul)
                                .padding(.vertical, 8)

                            GridAnuncios(
                                anuncios: viewModel.saved,
                                alturasVariables: false,
                                onTap: { path.append(.detalle(id: $0.id)) },
                                onSave: { viewModel.toggleSave(id: $0.id) }
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
            }
            .background(Color.ferBackground.ignoresSafeArea())
            .barraFER(
                onBusqueda: { path.append(.busqueda) },
                onNotificaciones: { path.append(.notificaciones) }
            )
            .navigationDestination(for: FeedRoute.self) { ruta in
                DestinoRuta(ruta: ruta, alAbrirDetalle: { path.append(.detalle(id: $0)) })
            }
        }
    }
}

#Preview {
    GuardadosScreen()
        .environment(AppViewModel(perfil: PerfilUsuario()))
}
