import SwiftUI
struct BusquedaScreen: View {
    let alAbrirDetalle: (String) -> Void

    @Environment(AppViewModel.self) private var viewModel
    @State private var texto = ""
    @State private var yaEnfocado = false
    @FocusState private var campoActivo: Bool

    private var consulta: String {
        texto.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var resultados: [Announcement] {
        let palabras = consulta.split(whereSeparator: { $0.isWhitespace }).map(String.init)
        guard !palabras.isEmpty else { return [] }
        return viewModel.announcements.filter { anuncio in
            let campos = [
                anuncio.title, anuncio.summary, anuncio.description,
                anuncio.author, anuncio.category.label
            ]
            return palabras.allSatisfy { palabra in
                campos.contains { $0.localizedStandardContains(palabra) }
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                BotonAtras()
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.ferMuted)
                    TextField("Buscar anuncios", text: $texto)
                        .focused($campoActivo)
                        .submitLabel(.search)
                        .autocorrectionDisabled()
                        .foregroundColor(.ferOnSurface)
                    if !texto.isEmpty {
                        Button {
                            texto = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.ferMuted)
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Borrar búsqueda")
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Capsule().fill(Color.ferTarjeta))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            if consulta.isEmpty {
                mensaje("Escribe para buscar anuncios.")
            } else if resultados.isEmpty {
                mensaje("No encontramos anuncios para “\(consulta)”.")
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(resultados.count == 1 ? "1 resultado" : "\(resultados.count) resultados")
                            .font(.subheadline)
                            .foregroundColor(.ferMuted)
                        GridAnuncios(
                            anuncios: resultados,
                            alturasVariables: false,
                            onTap: { alAbrirDetalle($0.id) },
                            onSave: { viewModel.toggleSave(id: $0.id) }
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
                .scrollDismissesKeyboard(.interactively)
            }
        }
        .background(Color.ferBackground.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            if !yaEnfocado {
                yaEnfocado = true
                campoActivo = true
            }
        }
    }

    private func mensaje(_ texto: String) -> some View {
        Text(texto)
            .font(.subheadline)
            .foregroundColor(.ferMuted)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationStack {
        BusquedaScreen(alAbrirDetalle: { _ in })
    }
    .environment(AppViewModel(perfil: PerfilUsuario()))
}
