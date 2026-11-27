import SwiftUI

struct FeedScreen: View {
    @Environment(AppViewModel.self) private var viewModel
    @State private var path: [FeedRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Para ti")
                        .font(.title2.bold())
                        .foregroundColor(.ferAzul)
                        .padding(.vertical, 8)

                    if let featured = viewModel.featured {
                        FeaturedCard(
                            announcement: featured,
                            onTap: { path.append(.detalle(id: featured.id)) },
                            onSave: { viewModel.toggleSave(id: featured.id) }
                        )
                    }

                    HStack {
                        Text("Descubre más")
                            .font(.headline.bold())
                            .foregroundColor(.ferOnSurface)
                        Spacer()
                    }
                    .padding(.top, 8)

                    GridAnuncios(
                        anuncios: viewModel.others,
                        onTap: { path.append(.detalle(id: $0.id)) },
                        onSave: { viewModel.toggleSave(id: $0.id) }
                    )
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
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
    FeedScreen()
        .environment(AppViewModel(perfil: PerfilUsuario()))
}
