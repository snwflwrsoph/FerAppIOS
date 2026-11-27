
import SwiftUI

struct TamanoTextoScreen: View {
    let seleccion: TamanoTexto
    let onSeleccionChange: (TamanoTexto) -> Void

    private struct Opcion: Identifiable {
        let tamano: TamanoTexto
        let titulo: String
        let descripcion: String
        var id: String { tamano.id }
    }

    private let opciones: [Opcion] = [
        Opcion(tamano: .chico, titulo: "Tamaño chico", descripcion: "Elegir un tamaño de texto más pequeño"),
        Opcion(tamano: .normal, titulo: "Tamaño mediano", descripcion: "Elegir el tamaño de texto recomendado"),
        Opcion(tamano: .grande, titulo: "Tamaño grande", descripcion: "Elegir un tamaño de texto más grande")
    ]

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Tamaño de texto")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
                    .padding(.horizontal, 52)
                HStack {
                    BotonAtras()
                    Spacer()
                }
            }
            .padding()
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(opciones) { opcion in
                        Button {
                            onSeleccionChange(opcion.tamano)
                        } label: {
                            HStack() {
                                VStack {
                                    Text(opcion.titulo)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .bold()
                                        .font(.title2)
                                    Text(opcion.descripcion)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.body)
                                }
                                Image(systemName: seleccion == opcion.tamano ? "largecircle.fill.circle" : "circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)
                                    .accessibilityHidden(true)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityAddTraits(seleccion == opcion.tamano ? .isSelected : [])
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
        .foregroundStyle(Color.ferOnSurface)
        .background(Color.ferBackground.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    TamanoTextoScreen(seleccion: .normal, onSeleccionChange: { _ in })
}
