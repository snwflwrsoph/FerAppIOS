import SwiftUI

struct NotificationCard: View {
    let announcement: Announcement
    var hasOpened = false
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 8) {
                Text(announcement.title)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if !hasOpened {
                    Circle()
                        .fill(Color.ferCeleste)
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(minHeight: 48)
            .background(Color.ferNavy)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .contentShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        .accessibilityValue(hasOpened ? "" : "Nueva")
    }
}
