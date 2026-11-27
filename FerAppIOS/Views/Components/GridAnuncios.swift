import SwiftUI

struct GridAnuncios: View {
    let anuncios: [Announcement]
    var alturasVariables = true
    let onTap: (Announcement) -> Void
    let onSave: (Announcement) -> Void

    var body: some View {
        let items = Array(anuncios.enumerated())
        HStack(alignment: .top, spacing: 12) {
            columna(items.filter { $0.offset % 2 == 0 })
            columna(items.filter { $0.offset % 2 == 1 })
        }
    }

    private func columna(_ items: [(offset: Int, element: Announcement)]) -> some View {
        LazyVStack(spacing: 12) {
            ForEach(items, id: \.element.id) { item in
                AnnouncementCard(
                    announcement: item.element,
                    imageHeight: alturasVariables && item.offset % 2 == 1 ? 110 : 150,
                    onTap: { onTap(item.element) },
                    onSave: { onSave(item.element) }
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
