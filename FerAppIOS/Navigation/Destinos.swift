import SwiftUI

struct DestinoRuta: View {
    let ruta: FeedRoute
    let alAbrirDetalle: (String) -> Void

    @Environment(AppViewModel.self) private var viewModel

    var body: some View {
        switch ruta {
        case .detalle(let id):
            DetalleDestino(id: id)
        case .busqueda:
            BusquedaScreen(alAbrirDetalle: alAbrirDetalle)
        case .notificaciones:
            NotificationScreen(
                anuncios: viewModel.announcements,
                leidas: viewModel.leidas,
                onAnnouncementClick: { alAbrirDetalle($0.id) }
            )
        }
    }
}
