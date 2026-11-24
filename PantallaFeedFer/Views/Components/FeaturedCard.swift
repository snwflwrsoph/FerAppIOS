
import SwiftUI

struct FeaturedCard: View {
    let announcement: Announcement
    let onTap: () -> Void
    let onSave: () -> Void

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AnnouncementImage(
                name: announcement.imageName,
                placeholderColor: announcement.category.placeholderColor
            )

            LinearGradient(
                stops: [
                    .init(color: .clear, location: 0.35),
                    .init(color: Color(hex: 0x081028, opacity: 0.92), location: 1),
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(announcement.title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .lineLimit(3)
                Text(announcement.summary)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .lineLimit(2)
            }
            .multilineTextAlignment(.leading)
            .padding(16)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 280)
        .overlay(alignment: .topLeading) {
            Text("DESTACADO · \(announcement.category.label.uppercased())")
                .font(.caption2.bold())
                .foregroundColor(.ferOnGold)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Capsule().fill(Color.ferGold))
                .padding(16)
        }
        .overlay(alignment: .topTrailing) {
            SaveButton(isSaved: announcement.isSaved, action: onSave)
                .padding(8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .contentShape(RoundedRectangle(cornerRadius: 24))
        .onTapGesture(perform: onTap)
    }
}
