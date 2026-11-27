import SwiftUI

private let maxNotificaciones = 30
struct NotificationScreen: View {
    let anuncios: [Announcement]
    let leidas: Set<String>
    let onAnnouncementClick: (Announcement) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                BotonAtras()
                Text("Notificaciones")
                    .font(.title2.bold())
                    .foregroundColor(.ferAzul)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            if anuncios.isEmpty {
                Text("No tienes notificaciones por ahora.")
                    .font(.subheadline)
                    .foregroundColor(.ferMuted)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(Array(anuncios.prefix(maxNotificaciones))) { anuncio in
                            NotificationCard(
                                announcement: anuncio,
                                hasOpened: leidas.contains(anuncio.id),
                                onTap: { onAnnouncementClick(anuncio) }
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
        }
        .background(Color.ferBackground.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    NotificationScreen(
        anuncios: Announcement.sample,
        leidas: [Announcement.sample[0].id],
        onAnnouncementClick: { _ in }
    )
}
