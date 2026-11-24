

import SwiftUI

struct AnnouncementCard: View {
    let announcement: Announcement
    let imageHeight: CGFloat
    let onTap: () -> Void
    let onSave: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            AnnouncementImage(
                name: announcement.imageName,
                placeholderColor: announcement.category.placeholderColor
            )
            .frame(height: imageHeight)
            .overlay(alignment: .topTrailing) {
                SaveButton(isSaved: announcement.isSaved, action: onSave)
                    .padding(4)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(announcement.category.label.uppercased())
                    .font(.caption2.bold())
                    .foregroundColor(.ferAzul)
                Text(announcement.title)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.ferOnSurface)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 3, y: 1)
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .onTapGesture(perform: onTap)
    }
}
