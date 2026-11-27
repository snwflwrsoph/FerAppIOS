import SwiftUI
struct DetalleDestino: View {
    let id: String
    @Environment(AppViewModel.self) private var viewModel

    var body: some View {
        Group {
            if let anuncio = viewModel.announcement(id: id) {
                NewsDetailView(
                    announcement: anuncio,
                    onLike: { viewModel.toggleLike(id: id) }
                )
            } else {
                PantallaPendiente(
                    titulo: "Anuncio",
                    texto: "Este anuncio ya no está disponible.",
                    mostrarRegresar: true
                )
            }
        }
        .onAppear { viewModel.marcarLeida(id: id) }
    }
}
