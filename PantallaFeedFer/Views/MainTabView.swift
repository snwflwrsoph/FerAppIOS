
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedScreen()
                .tabItem { Label("Inicio", systemImage: "house") }

            PlaceholderScreen(titulo: "Guardados")
                .tabItem { Label("Guardados", systemImage: "star") }

            PlaceholderScreen(titulo: "Preferencias")
                .tabItem { Label("Preferencias", systemImage: "slider.horizontal.3") }

            PlaceholderScreen(titulo: "Ajustes")
                .tabItem { Label("Ajustes", systemImage: "gearshape") }
        }
        .tint(.ferAzul)
    }
}

private struct PlaceholderScreen: View {
    let titulo: String

    var body: some View {
        ZStack {
            Color.ferBackground.ignoresSafeArea()
            Text("\(titulo) pendiente")
                .foregroundColor(.ferMuted)
        }
    }
}
