import SwiftUI
struct PreferenciasScreen: View {
    let seleccionInicial: Int?
    let onRegresar: (() -> Void)?
    let onContinuar: (Int) -> Void
    var body: some View {
        SeleccionView(opciones: Catalogo.perfiles, seleccionInicial: seleccionInicial, esUltimoPaso: { $0 == 2 }, onRegresar: onRegresar, onContinuar: { id, _ in onContinuar(id) })
    }
}

#Preview("1. Tipo de usuario") {
    PreferenciasScreen(seleccionInicial: nil, onRegresar: nil, onContinuar: { _ in })
}
