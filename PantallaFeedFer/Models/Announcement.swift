import SwiftUI

enum AnnouncementCategory {
    case anniversary, call, stories, alliances, events, general

    var label: String {
        switch self {
        case .anniversary: return "80 aniversario"
        case .call: return "Convocatoria"
        case .stories: return "Historias"
        case .alliances: return "Alianzas"
        case .events: return "Eventos"
        case .general: return "Anuncio"
        }
    }

    var placeholderColor: Color {
        switch self {
        case .anniversary: return Color(hex: 0x2F5597)
        case .call: return Color(hex: 0x2F6B6E)
        case .stories: return Color(hex: 0x8A6A2A)
        case .alliances: return Color(hex: 0x5A4A86)
        case .events: return Color(hex: 0x7A3E3E)
        case .general: return Color(hex: 0x4A5370)
        }
    }
}

struct Announcement: Identifiable, Hashable {
    let id: String
    let title: String
    let summary: String
    let category: AnnouncementCategory
    let imageName: String?      // nombre del asset en Assets.xcassets
    var isFeatured: Bool = false
    var isSaved: Bool = false
}

extension Announcement {
    static let sample: [Announcement] = [
        Announcement(
            id: "1",
            title: "Desayuno 80 aniversario de Fundación Esposos Rodríguez",
            summary: "En Fundación Esposos Rodríguez iniciamos las actividades conmemorativas por nuestro 80 aniversario…",
            category: .anniversary,
            imageName: "ColaboradorasEsposos",
            isFeatured: true
        ),
        Announcement(
            id: "2",
            title: "Beca de Excelencia 2026 para jóvenes sonorenses",
            summary: "Conoce los requisitos y fechas de la convocatoria.",
            category: .call,
            imageName: "EdificioEsposos"
        ),
        Announcement(
            id: "3",
            title: "Me voy a la maestría con la Beca de Excelencia",
            summary: "La historia de uno de nuestros becarios.",
            category: .stories,
            imageName: "BecadosEsposos"
        ),
        Announcement(
            id: "4",
            title: "Presentación de la nueva generación de becarios",
            summary: "Conoce a los jóvenes que inician su camino con nosotros.",
            category: .events,
            imageName: "DiscursoEsposos"
        ),
        Announcement(
            id: "5",
            title: "Cena anual de la Fundación",
            summary: "Una noche de convivencia con benefactores y becarios.",
            category: .events,
            imageName: "EspososRodriguez"
        ),
        Announcement(
            id: "6",
            title: "Nuevas alianzas para impulsar la educación",
            summary: "Sumamos aliados que fortalecen nuestros programas de becas.",
            category: .alliances,
            imageName: "ProgramaEsposos"
        ),
        Announcement(
            id: "7",
            title: "Resultados de la convocatoria de becas",
            summary: "Consulta si fuiste seleccionado.",
            category: .call,
            imageName: "BecadosEsposos"
        ),
        Announcement(
            id: "8",
            title: "[Título del anuncio]",
            summary: "[Descripción del anuncio]",
            category: .general,
            imageName: nil
        ),
    ]
}
