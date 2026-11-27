import SwiftUI
struct BotonAtras: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.ferNavy)
                .frame(width: 44, height: 44)
                .background(Circle().fill(Color.ferBotones))
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Regresar")
    }
}
