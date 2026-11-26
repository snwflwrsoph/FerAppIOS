import SwiftUI

struct SeleccionView: View {
    let opciones: [OpcionSeleccion]
    let esUltimoPaso: (Int?) -> Bool
    let onRegresar: () -> Void
    let onContinuar: (Int) -> Void

    @State private var seleccionadoId: Int?

    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 32)

            Text("Bienvenido")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.ferNavy)

            Spacer().frame(height: 20)

            VStack(alignment: .leading, spacing: 2) {
                Text("Selecciona quién eres")
                    .font(.system(size: 20))
                    .foregroundColor(.ferNavy)
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.ferCeleste)
                    .frame(width: 38, height: 4)
            }

            Spacer()

            VStack(spacing: 20) {
                ForEach(opciones) { opcion in
                    TarjetaOpcion(
                        opcion: opcion,
                        seleccionada: seleccionadoId == opcion.id
                    ) {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            seleccionadoId = opcion.id
                        }
                    }
                }
            }

            Spacer()

            HStack {
                BotonCircular(
                    icono: "arrow.left",
                    descripcion: "Regresar",
                    habilitado: true,
                    accion: onRegresar
                )

                Spacer()

                BotonCircular(
                    icono: esUltimoPaso(seleccionadoId) ? "checkmark" : "arrow.right",
                    descripcion: esUltimoPaso(seleccionadoId) ? "Confirmar" : "Siguiente",
                    habilitado: seleccionadoId != nil
                ) {
                    if let id = seleccionadoId { onContinuar(id) }
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 24)
        .background(Color.white.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeleccionView(
        opciones: Catalogo.universidadesPrivadas,
        esUltimoPaso: { _ in true },
        onRegresar: {},
        onContinuar: { _ in }
    )
}
