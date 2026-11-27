import SwiftUI
struct NivelEducativoScreen: View {
    let seleccionInicial: Int?
    let onRegresar: () -> Void
    let onContinuar: (Int) -> Void
    var body: some View {
        SeleccionView(opciones: Catalogo.nivelesEducativos, subtitulo: "Selecciona tu nivel educativo", seleccionInicial: seleccionInicial, esUltimoPaso: { $0 != nil && $0 != 2 }, onRegresar: onRegresar, onContinuar: { id, _ in onContinuar(id) })
    }
}

#Preview("2. Nivel educativo") {
    NivelEducativoScreen(seleccionInicial: nil, onRegresar: {}, onContinuar: { _ in })
}
