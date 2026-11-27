import Foundation

enum TamanoTexto: String, CaseIterable, Identifiable {
    case chico, normal, grande

    var id: String { rawValue }

    var label: String {
        switch self {
        case .chico: return "Chico"
        case .normal: return "Normal"
        case .grande: return "Grande"
        }
    }

    var subtitulo: String {
        switch self {
        case .chico: return "Texto más compacto"
        case .normal: return "Tamaño estándar recomendado"
        case .grande: return "Texto más grande y accesible"
        }
    }

    var pasos: Int {
        switch self {
        case .chico: return -2
        case .normal: return 0
        case .grande: return 1
        }
    }
}
