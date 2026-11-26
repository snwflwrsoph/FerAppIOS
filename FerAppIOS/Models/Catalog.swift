//
//  Untitled.swift
//  FerAppIOS
//
//  Created by MAC on 25/11/26.
//

import Foundation
struct Catalogo {
    static let otraID = 99
    static let fer = "Accede a avisos, convocatorias y beneficios exclusivos para becarios FER."
    static let futuros = "Convocatorias y avisos para futuros becarios."
    static let perfiles = [
        OpcionSeleccion(id: 1, titulo: "Becario", descripcion: fer, icono: "graduation"),
        OpcionSeleccion(id: 2, titulo: "Aspirante", descripcion: futuros, icono: "binoculares")
    ]
    static let nivelesEducativos = [
        OpcionSeleccion(id: 1, titulo: "Preparatoria", descripcion: "Accede a avisos, convocatorias y beneficios educativos para becarios FER.", icono: "backpack"),
        OpcionSeleccion(id: 2, titulo: "Universidad", descripcion: futuros, icono: "education"),
        OpcionSeleccion(id: 3, titulo: "Maestría", descripcion: futuros, icono: "airplane")
    ]
    static let tiposUniversidad = [
        OpcionSeleccion(id: 1, titulo: "Universidad Pública", descripcion: fer, icono: "ic_universidad"),
        OpcionSeleccion(id: 2, titulo: "Universidad Privada", descripcion: futuros, icono: "ic_universidad")
    ]
    static let universidadesPrivadas = [
        OpcionSeleccion(id: 1, titulo: "UDEM", descripcion: fer, icono: "logo_udem"),
        OpcionSeleccion(id: 2, titulo: "CETYS", descripcion: futuros, icono: "logo_cetys"),
        OpcionSeleccion(id: 3, titulo: "Tec de Monterrey", descripcion: futuros, icono: "logo_tec")
    ]
    static let universidadesPublicas = [
        OpcionSeleccion(id: 1, titulo: "UNAM", descripcion: "Universidad Nacional Autónoma de México.", icono: "ic_universidad"),
        OpcionSeleccion(id: 2, titulo: "IPN", descripcion: "Instituto Politécnico Nacional.", icono: "ic_universidad"),
        OpcionSeleccion(id: 3, titulo: "UAM", descripcion: "Universidad Autónoma Metropolitana.", icono: "ic_universidad"),
        OpcionSeleccion(id: otraID, titulo: "Otra", descripcion: "Escribe el nombre de tu universidad pública.", icono: "ic_universidad")
    ]
}
