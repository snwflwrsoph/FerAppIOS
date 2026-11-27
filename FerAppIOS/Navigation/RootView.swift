import SwiftUI

struct RootView: View {
    @Environment(AppViewModel.self) private var viewModel

    var body: some View {
        if viewModel.perfil.onboardingCompleto {
            MainTabView()
        } else {
            FlujoPreferencias(
                perfil: viewModel.perfil,
                onFinalizar: { nuevo in viewModel.perfil = nuevo }
            )
        }
    }
}
