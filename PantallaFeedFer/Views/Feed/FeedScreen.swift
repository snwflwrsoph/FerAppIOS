
import SwiftUI

struct FeedScreen: View {
    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Para ti")
                        .font(.title2.bold())
                        .foregroundColor(.ferAzul)
                        .padding(.vertical, 8)

                    if let featured = viewModel.featured {
                        FeaturedCard(
                            announcement: featured,
                            onTap: {},
                            onSave: { viewModel.toggleSave(featured) }
                        )
                    }

                    HStack {
                        Text("Descubre más")
                            .font(.headline.bold())
                            .foregroundColor(.ferOnSurface)
                        Spacer()
                        Button("Ver todo") {}
                            .fontWeight(.bold)
                            .foregroundColor(.ferAzul)
                    }
                    .padding(.top, 8)

                    columnas
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .background(Color.ferBackground.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("FERLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .sharedBackgroundVisibility(.hidden)
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {} label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .accessibilityLabel("Buscar anuncios")
                    Button {} label: {
                        Image(systemName: "bell")
                    }
                    .accessibilityLabel("Notificaciones")
                }
            }
            .toolbarBackground(Color.ferAzul, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .tint(.white)
        }
    }

    private var columnas: some View {
        let items = Array(viewModel.others.enumerated())
        let izquierda = items.filter { $0.offset % 2 == 0 }
        let derecha = items.filter { $0.offset % 2 == 1 }

        return HStack(alignment: .top, spacing: 12) {
            columna(izquierda)
            columna(derecha)
        }
    }

    private func columna(_ items: [(offset: Int, element: Announcement)]) -> some View {
        LazyVStack(spacing: 12) {
            ForEach(items, id: \.element.id) { item in
                AnnouncementCard(
                    announcement: item.element,
                    imageHeight: item.offset % 2 == 0 ? 150 : 110,
                    onTap: {},
                    onSave: { viewModel.toggleSave(item.element) }
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
