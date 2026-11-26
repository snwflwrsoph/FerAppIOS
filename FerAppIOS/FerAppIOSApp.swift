//
//  FerAppIOSApp.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//
import SwiftUI

@main
struct FerAppIOSApp: App {
    var body: some Scene {
        WindowGroup {
            SeleccionView(
                opciones: Catalogo.perfiles,
                subtitulo: "Selecciona quién eres",
                esUltimoPaso: { $0 == 2 },
                onRegresar: nil,
                onContinuar: { id, texto in
                    print("Opción seleccionada: \(id)")
                }
            )
        }
    }
}

