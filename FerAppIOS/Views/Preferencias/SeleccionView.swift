import SwiftUI
struct SeleccionView: View {
    let opciones: [OpcionSeleccion]
    let subtitulo: String
    let esUltimoPaso: (Int?) -> Bool
    let onRegresar: (() -> Void)?
    let onContinuar: (Int, String) -> Void
    @State private var seleccionadoId: Int?
    @State private var otraUniversidadTexto: String
    init(opciones: [OpcionSeleccion], subtitulo: String = "Selecciona quién eres", seleccionInicial: Int? = nil, textoInicial: String = "", esUltimoPaso: @escaping (Int?) -> Bool, onRegresar: (() -> Void)?, onContinuar: @escaping (Int, String) -> Void) {
        self.opciones = opciones
        self.subtitulo = subtitulo
        self.esUltimoPaso = esUltimoPaso
        self.onRegresar = onRegresar
        self.onContinuar = onContinuar
        _seleccionadoId = State(initialValue: seleccionInicial)
        _otraUniversidadTexto = State(initialValue: textoInicial)
    }
    var habilitado: Bool {
        guard let id = seleccionadoId else { return false }
        return id != Catalogo.otraID || !otraUniversidadTexto.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    var body: some View {
        VStack(spacing: 20) {
            Text("Bienvenido").font(.system(size: 26, weight: .bold)).foregroundColor(.ferNavy)
            VStack(alignment: .leading, spacing: 2) {
                Text(subtitulo).font(.system(size: 20)).foregroundColor(.ferNavy)
                RoundedRectangle(cornerRadius: 2).fill(Color.ferCeleste).frame(width: 38, height: 4)
            }
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(opciones) { opcion in
                        TarjetaOpcion(opcion: opcion, seleccionada: seleccionadoId == opcion.id) {
                            withAnimation(.easeInOut(duration: 0.15)) { seleccionadoId = opcion.id }
                        }
                        if opcion.id == Catalogo.otraID && seleccionadoId == opcion.id {
                            TextField("Nombre de tu universidad", text: $otraUniversidadTexto).textFieldStyle(.roundedBorder)
                        }
                    }
                }.padding(2)
            }
            HStack {
                if let regresar = onRegresar {
                    BotonCircular(icono: "arrow.left", descripcion: "Regresar", habilitado: true, accion: regresar)
                }
                Spacer()
                BotonCircular(icono: esUltimoPaso(seleccionadoId) ? "checkmark" : "arrow.right", descripcion: esUltimoPaso(seleccionadoId) ? "Confirmar" : "Siguiente", habilitado: habilitado) {
                    if let id = seleccionadoId { onContinuar(id, id == Catalogo.otraID ? otraUniversidadTexto.trimmingCharacters(in: .whitespacesAndNewlines) : "") }
                }
            }.padding(.bottom, 16)
        }.padding(.horizontal, 32).padding(.vertical, 24)
         .background(Color.white.ignoresSafeArea()).preferredColorScheme(.light)
         .navigationBarBackButtonHidden(true)
    }
}

#Preview("3. Tipo de universidad") {
    SeleccionView(opciones: Catalogo.tiposUniversidad,
                  esUltimoPaso: { $0 == 1 },
                  onRegresar: {}, onContinuar: { _, _ in })
}

#Preview("4. Universidad privada") {
    SeleccionView(opciones: Catalogo.universidadesPrivadas,
                  esUltimoPaso: { _ in true },
                  onRegresar: {}, onContinuar: { _, _ in })
}
