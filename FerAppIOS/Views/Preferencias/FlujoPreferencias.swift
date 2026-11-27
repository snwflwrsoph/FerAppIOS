import SwiftUI
struct FlujoPreferencias: View {
    enum Paso { case perfil, nivel, tipo, universidad }
    @State private var paso: Paso = .perfil
    @State private var borrador: PerfilUsuario
    private let persistir: Bool
    let onCancelar: (() -> Void)?
    let onFinalizar: (PerfilUsuario) -> Void
    init(perfil: PerfilUsuario = PerfilUsuario(), onCancelar: (() -> Void)? = nil, onFinalizar: @escaping (PerfilUsuario) -> Void, persistir: Bool = true) {
        _borrador = State(initialValue: perfil)
        self.onCancelar = onCancelar
        self.onFinalizar = onFinalizar
        self.persistir = persistir
    }
    var body: some View {
        Group {
            switch paso {
            case .perfil:
                PreferenciasScreen(seleccionInicial: borrador.tipoUsuario, onRegresar: onCancelar) { id in
                    if borrador.tipoUsuario != id { borrador.nivelEducativo = nil; limpiarUniversidad() }
                    borrador.tipoUsuario = id
                    if id == 2 { borrador.nivelEducativo = nil; limpiarUniversidad(); finalizar() } else { paso = .nivel }
                }
            case .nivel:
                NivelEducativoScreen(seleccionInicial: borrador.nivelEducativo, onRegresar: { paso = .perfil }) { id in
                    if borrador.nivelEducativo != id { limpiarUniversidad() }
                    borrador.nivelEducativo = id
                    if id == 2 { paso = .tipo } else { limpiarUniversidad(); finalizar() }
                }
            case .tipo:
                SeleccionView(opciones: Catalogo.tiposUniversidad, seleccionInicial: borrador.tipoUniversidad, esUltimoPaso: { $0 == 1 }, onRegresar: { paso = .nivel }) { id, _ in
                    if borrador.tipoUniversidad != id { borrador.universidadId = nil; borrador.universidadOtra = nil }
                    borrador.tipoUniversidad = id
                    if id == 1 { borrador.universidadId = nil; borrador.universidadOtra = nil; finalizar() } else { paso = .universidad }
                }
            case .universidad:
                SeleccionView(opciones: borrador.tipoUniversidad == 1 ? Catalogo.universidadesPublicas : Catalogo.universidadesPrivadas, seleccionInicial: borrador.universidadId, textoInicial: borrador.universidadOtra ?? "", esUltimoPaso: { _ in true }, onRegresar: { paso = .tipo }) { id, texto in
                    borrador.universidadId = id
                    borrador.universidadOtra = id == Catalogo.otraID ? texto : nil
                    finalizar()
                }
            }
        }.id(paso)
    }
    private func limpiarUniversidad() {
        borrador.tipoUniversidad = nil; borrador.universidadId = nil; borrador.universidadOtra = nil
    }
    private func finalizar() {
        borrador.onboardingCompleto = true
        if persistir { borrador.guardar() }
        onFinalizar(borrador)
    }
}

#Preview("Flujo completo FER") {
    FlujoPreferencias(onFinalizar: { _ in }, persistir: false)
}
