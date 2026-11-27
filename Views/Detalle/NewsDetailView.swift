import SwiftUI

struct NewsDetailView: View {
    let announcement: Announcement
    var onLike: () -> Void = {}
    var onCalendar: () -> Void = {}

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    .accessibilityLabel("Regresar")
                    Spacer()
                }
                AnnouncementImage(
                    name: announcement.mainImage,
                    placeholderColor: announcement.category.placeholderColor
                )
                .aspectRatio(16 / 9, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                Text(announcement.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 12) {
                    Image(announcement.profile)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 50)
                    Text(announcement.author)
                        .foregroundStyle(.secondary)

                    Spacer()
                    Text(announcement.date)
                        .foregroundStyle(.secondary)
                }
                Text(announcement.description)
                let secundarias = [announcement.secondaryImage, announcement.tertiaryImage].compactMap { $0 }
                if !secundarias.isEmpty {
                    HStack(spacing: 12) {
                        ForEach(secundarias, id: \.self) { nombre in
                            AnnouncementImage(
                                name: nombre,
                                placeholderColor: announcement.category.placeholderColor
                            )
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                        }
                    }
                }
                HStack(spacing: 12) {
                    Button(action: onLike) {
                        Image(systemName: announcement.isLikedByUser ? "heart.fill" : "heart")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(announcement.isLikedByUser ? Color.red : Color.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    .accessibilityLabel(announcement.isLikedByUser ? "Quitar me gusta" : "Me gusta")
                    Text(String(announcement.likes))

                    Button(action: onCalendar) {
                        Image(systemName: "calendar")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    .accessibilityLabel("Agregar a calendario")
                    Text("Agregar a calendario")
                }
            }
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar) 
    }
}

#Preview {
    NewsDetailView(announcement: Announcement.sample[0])
}
