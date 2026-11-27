import SwiftUI
import UIKit
import UserNotifications

struct PermisosScreen: View {
    @Environment(\.openURL) private var openURL
    private func gestionarPermisoNotificaciones() {
        Task {
            let centro = UNUserNotificationCenter.current()
            let ajustes = await centro.notificationSettings()
            if ajustes.authorizationStatus == .notDetermined {
                _ = try? await centro.requestAuthorization(options: [.alert, .badge, .sound])
            } else if let url = URL(string: UIApplication.openNotificationSettingsURLString) {
                openURL(url)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Permisos")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
                    .padding(.horizontal, 52)
                HStack {
                    BotonAtras()
                    Spacer()
                }
            }
            .padding()
            ScrollView {
                VStack(spacing: 16) {
                    Button {
                        gestionarPermisoNotificaciones()
                    } label: {
                        HStack {
                            VStack {
                                Text("Notificaciones")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .font(.title2)
                                Text("Modificar el estado del permiso de notificaciones")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.body)
                            }
                            Image(systemName: "chevron.right")
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Divider()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
        .foregroundStyle(Color.ferOnSurface)
        .background(Color.ferBackground.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    PermisosScreen()
}
