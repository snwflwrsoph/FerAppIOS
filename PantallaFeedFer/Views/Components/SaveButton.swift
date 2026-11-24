
import SwiftUI

struct SaveButton: View {
    let isSaved: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isSaved ? "star.fill" : "star")
                .font(.system(size: 18))
                .foregroundColor(isSaved ? .ferGold : .white)
                .frame(width: 40, height: 40)
                .background(Circle().fill(Color(hex: 0x081028, opacity: 0.5)))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isSaved ? "Quitar de guardados" : "Guardar anuncio")
    }
}
