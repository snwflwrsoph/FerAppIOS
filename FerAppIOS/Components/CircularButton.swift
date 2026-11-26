//
//  CircularButton.swift
//  FerAppIOS
//
//  Created by MAC on 25/11/26.
//

import SwiftUI
struct BotonCircular: View {
    let icono: String
    let descripcion: String
    let habilitado: Bool
    let accion: () -> Void
    var body: some View {
        Button(action: accion) {
            Image(systemName: icono).font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white).frame(width: 56, height: 56)
                .background(habilitado ? Color.ferNavy : Color.ferDeshabilitado)
                .clipShape(Circle())
        }.buttonStyle(.plain).disabled(!habilitado).accessibilityLabel(descripcion)
    }
}
