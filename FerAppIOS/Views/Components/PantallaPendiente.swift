import SwiftUI
struct PantallaPendiente: View {
    let titulo: String
    var texto: String? = nil
    var mostrarRegresar = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.ferBackground.ignoresSafeArea()

            Text(texto ?? "\(titulo) pendiente")
                .foregroundColor(.ferMuted)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            if mostrarRegresar {
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
                .padding()
                .accessibilityLabel("Regresar")
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(mostrarRegresar ? .hidden : .automatic, for: .tabBar)
    }
}

#Preview {
    PantallaPendiente(titulo: "Búsqueda", mostrarRegresar: true)
}
