import SwiftUI
struct BarraFER: ViewModifier {
    let onBusqueda: () -> Void
    let onNotificaciones: () -> Void

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("FERLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .sharedBackgroundVisibility(.hidden)
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: onBusqueda) {
                        Image(systemName: "magnifyingglass")
                    }
                    .accessibilityLabel("Buscar anuncios")
                    Button(action: onNotificaciones) {
                        Image(systemName: "bell")
                    }
                    .accessibilityLabel("Notificaciones")
                }
            }
            .toolbarBackground(Color.ferAzulBarra, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .tint(.white)
    }
}

extension View {
    func barraFER(onBusqueda: @escaping () -> Void, onNotificaciones: @escaping () -> Void) -> some View {
        modifier(BarraFER(onBusqueda: onBusqueda, onNotificaciones: onNotificaciones))
    }
}
