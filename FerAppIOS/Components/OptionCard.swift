//
//  OptionCard.swift
//  FerAppIOS
//
//  Created by MAC on 25/11/26.
//

import SwiftUI
import UIKit
struct TarjetaOpcion: View {
    let opcion: OpcionSeleccion
    let seleccionada: Bool
    let accion: () -> Void
    var body: some View {
        Button(action: accion) {
            HStack(spacing: 12) {
                Group {
                    if UIImage(named: opcion.icono) != nil {
                        Image(opcion.icono).resizable().scaledToFit()
                    } else {
                        Image(systemName: "building.columns").resizable().scaledToFit()
                    }
                }.frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 5) {
                    Text(opcion.titulo).font(.system(size: 18, weight: .semibold))
                    Text(opcion.descripcion).font(.system(size: 13))
                }
                Spacer(minLength: 4)
                Image(systemName: seleccionada ? "largecircle.fill.circle" : "circle")
                    .font(.system(size: 22))
            }
            .foregroundColor(.ferNavy)
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 110, alignment: .leading)
            .background(seleccionada ? Color.ferTarjetaSeleccionada : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.ferNavy, lineWidth: seleccionada ? 2 : 1))
        }.buttonStyle(.plain)
         .accessibilityAddTraits(seleccionada ? .isSelected : [])
    }
}
