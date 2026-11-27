import SwiftUI

struct TamanoTextoModifier: ViewModifier {
    @Environment(\.dynamicTypeSize) private var tamanoDelSistema
    let tamano: TamanoTexto

    func body(content: Content) -> some View {
        content.dynamicTypeSize(tamanoFinal)
    }

    private var tamanoFinal: DynamicTypeSize {
        let todos = DynamicTypeSize.allCases
        let actual = todos.firstIndex(of: tamanoDelSistema) ?? 0
        let nuevo = min(max(actual + tamano.pasos, 0), todos.count - 1)
        return todos[nuevo]
    }
}
