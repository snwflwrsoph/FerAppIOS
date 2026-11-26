//
//  UserProfile.swift
//  FerAppIOS
//
//  Created by MAC on 26/11/26.
//

import Foundation

struct PerfilUsuario: Codable {
    var tipoUsuario: Int? = nil
    var nivelEducativo: Int? = nil
    var tipoUniversidad: Int? = nil
    var universidadId: Int? = nil
    var universidadOtra: String? = nil
    var onboardingCompleto = false
    static let clave = "fer_perfil_ios"
    static func cargar() -> PerfilUsuario {
        guard let data = UserDefaults.standard.data(forKey: clave),
              let perfil = try? JSONDecoder().decode(Self.self, from: data) else { return Self() }
        return perfil
    }
    func guardar() {
        if let data = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(data, forKey: Self.clave)
        }
    }
}
