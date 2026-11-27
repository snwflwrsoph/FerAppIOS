import SwiftUI

@main
struct FerAppIOSApp: App {
    @State private var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(viewModel)
                .modifier(TamanoTextoModifier(tamano: viewModel.tamanoTexto))
                .preferredColorScheme(viewModel.modoOscuro ? .dark : .light)
        }
    }
}
