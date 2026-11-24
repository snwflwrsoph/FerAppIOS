import SwiftUI
struct AnnouncementImage: View {
    let name: String?
    let placeholderColor: Color

    var body: some View {
        Color.clear
            .overlay {
                if let name, UIImage(named: name) != nil {
                    Image(name)
                        .resizable()
                        .scaledToFill()
                } else {
                    ZStack {
                        placeholderColor
                        Text("FOTO")
                            .font(.system(size: 11))
                            .tracking(1.5)
                            .foregroundColor(.white.opacity(0.85))
                    }
                }
            }
            .clipped()
    }
}
