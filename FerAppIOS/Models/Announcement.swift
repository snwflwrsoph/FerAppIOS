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
    let description: String
    let author: String
    let date: String
    let category: AnnouncementCategory
    let profile: String
    let mainImage: String?
    var secondaryImage: String? = nil
    var tertiaryImage: String? = nil
    var isFeatured: Bool = false
    var isSaved: Bool = false
    var likes: Int = 0
    var isLikedByUser: Bool = false
    var eventStartMillis: Int64? = nil
    var eventEndMillis: Int64? = nil
    var location: String? = nil
}

// extensión para obtener la fecha y poder agregar eventos al calendario
extension Announcement {
    var eventStartDate: Date? {
        eventStartMillis.map {Date(timeIntervalSince1970: TimeInterval($0) / 1000)}
    }
    
    var eventEndDate: Date? {
        if let end = eventEndMillis {
            return Date(timeIntervalSince1970: TimeInterval(end) / 100)
        }
        return eventStartDate?.addingTimeInterval(60 * 60)
    }
    
    var hasEvent: Bool { eventStartDate != nil }
}


private let textoDesayuno = """
En un ambiente de convivencia, gratitud y compromiso social, la Fundación celebró un desayuno conmemorativo con motivo de su aniversario, reuniendo a colaboradores, benefactores, voluntarios e invitados especiales que han sido parte fundamental de su trayectoria.

Durante el evento, se destacaron los logros alcanzados a lo largo de los años, así como el impacto positivo que la organización ha generado en la comunidad a través de sus diversos programas y proyectos. Los asistentes tuvieron la oportunidad de compartir experiencias, fortalecer vínculos y reafirmar su compromiso con la misión de la fundación.

Representantes de la institución agradecieron el apoyo y la confianza de quienes han contribuido al crecimiento de la organización, resaltando que cada acción solidaria ha permitido transformar vidas y construir un futuro con mayores oportunidades para quienes más lo necesitan.

El desayuno concluyó con un mensaje de esperanza y renovación, invitando a continuar trabajando en conjunto para seguir impulsando iniciativas que promuevan el bienestar y el desarrollo de la comunidad.
"""

private let textoBeca = """
Con el objetivo de impulsar la formación académica y el desarrollo profesional de jóvenes talentos, se anunció la apertura de una nueva convocatoria de becas para realizar estudios de maestría en prestigiosas universidades del extranjero.

El programa brindará apoyo económico a estudiantes y profesionistas destacados que deseen continuar su preparación en áreas estratégicas como ciencia, tecnología, ingeniería, salud, educación, negocios y desarrollo sostenible. Las becas podrán cubrir gastos relacionados con matrícula, manutención, transporte y seguro médico, dependiendo de las condiciones establecidas en la convocatoria.

Las personas interesadas deberán cumplir con requisitos académicos, demostrar excelencia en su trayectoria educativa y acreditar el dominio del idioma requerido por la institución de destino. El proceso de selección considerará el mérito académico, el potencial de liderazgo y el impacto que los estudios tendrán en el desarrollo profesional de los candidatos.

Se invita a los aspirantes a consultar las bases completas de la convocatoria y preparar con anticipación la documentación necesaria para participar en el proceso de selección.
"""

private let textoHistoria = """
Cuando Ana Martínez terminó su licenciatura en Ingeniería Ambiental, sabía que quería contribuir a resolver los desafíos relacionados con el uso sostenible del agua en su comunidad. Sin embargo, los costos de estudiar una maestría en el extranjero parecían un obstáculo difícil de superar.

Tras meses de preparación, presentó su solicitud a un programa de becas internacionales y fue seleccionada entre cientos de aspirantes. Gracias al apoyo recibido, pudo cursar una maestría en Gestión de Recursos Hídricos en una reconocida universidad de Europa.

“Esta beca cambió mi vida. No solo me dio acceso a una educación de calidad, sino que me permitió regresar con conocimientos y experiencias que ahora puedo aplicar para generar un impacto positivo”, señala la joven profesionista.

Su historia es un ejemplo de cómo las oportunidades educativas pueden transformar vidas y contribuir al desarrollo de las comunidades.
"""

extension Announcement {
    static let sample: [Announcement] = [
        Announcement(
            id: "1",
            title: "Desayuno 80 aniversario de Fundación Esposos Rodríguez",
            summary: "En Fundación Esposos Rodríguez iniciamos las actividades conmemorativas por nuestro 80 aniversario…",
            description: textoDesayuno,
            author: "Comunicación FER",
            date: "16 de octubre del 2026",
            category: .anniversary,
            profile: "FERLogo",
            mainImage: "ColaboradorasEsposos",
            secondaryImage: "aniversario2",
            tertiaryImage: "aniversario3",
            isFeatured: true,
            likes: 42
        ),
        Announcement(
            id: "2",
            title: "Beca de Excelencia 2026 para jóvenes sonorenses",
            summary: "Conoce los requisitos y fechas de la convocatoria.",
            description: textoBeca,
            author: "Becas FER",
            date: "12 de noviembre del 2026",
            category: .call,
            profile: "FERLogo",
            mainImage: "EdificioEsposos",
            likes: 35
        ),
        Announcement(
            id: "3",
            title: "Me voy a la maestría con la Beca de Excelencia",
            summary: "La historia de uno de nuestros becarios.",
            description: textoHistoria,
            author: "Comunicación FER",
            date: "26 de noviembre del 2026",
            category: .stories,
            profile: "FERLogo",
            mainImage: "BecadosEsposos",
            likes: 67
        ),
        Announcement(
            id: "4",
            title: "Presentación de la nueva generación de becarios",
            summary: "Conoce a los jóvenes que inician su camino con nosotros.",
            description: "Conoce a los jóvenes que inician su camino con nosotros. Más información próximamente.",
            author: "Comunicación FER",
            date: "18 de noviembre del 2026",
            category: .events,
            profile: "FERLogo",
            mainImage: "DiscursoEsposos",
            eventStartMillis: 1_764_345_600_000
        ),
        Announcement(
            id: "5",
            title: "Cena anual de la Fundación",
            summary: "Una noche de convivencia con benefactores y becarios.",
            description: "Una noche de convivencia con benefactores y becarios. Más información próximamente.",
            author: "Comunicación FER",
            date: "20 de noviembre del 2026",
            category: .events,
            profile: "FERLogo",
            mainImage: "EspososRodriguez"
        ),
        Announcement(
            id: "6",
            title: "Nuevas alianzas para impulsar la educación",
            summary: "Sumamos aliados que fortalecen nuestros programas de becas.",
            description: "Sumamos aliados que fortalecen nuestros programas de becas. Más información próximamente.",
            author: "Comunicación FER",
            date: "22 de noviembre del 2026",
            category: .alliances,
            profile: "FERLogo",
            mainImage: "ProgramaEsposos"
        ),
        Announcement(
            id: "7",
            title: "Resultados de la convocatoria de becas",
            summary: "Consulta si fuiste seleccionado.",
            description: "Consulta si fuiste seleccionado. Más información próximamente.",
            author: "Becas FER",
            date: "23 de noviembre del 2026",
            category: .call,
            profile: "FERLogo",
            mainImage: "BecadosEsposos"
        ),
        Announcement(
            id: "8",
            title: "[Título del anuncio]",
            summary: "[Descripción del anuncio]",
            description: "[Descripción del anuncio]",
            author: "Comunicación FER",
            date: "24 de noviembre del 2026",
            category: .general,
            profile: "FERLogo",
            mainImage: nil
        ),
        Announcement(
            id: "9",
            title: "80 Aniversario FER",
            summary: "Gran anuncio sobre el evento del 80 aniversario de Fundación Esposos Rodríguez wuuuuu!!!!",
            description: "Se llevará acabo un super mega evento para celebrar nuestro aniversario. Todos los becarios están invitados!!!",
            author: "Comunicación FER",
            date: "24 de noviembre del 2026",
            category: .anniversary,
            profile: "FERLogo",
            mainImage: "aniversario1",
            secondaryImage: "aniversario2",
            tertiaryImage: "aniversario3",
            likes: 67,
            eventStartMillis: Int64((Date().timeIntervalSince1970 * 1000).rounded()),
            eventEndMillis: Int64((Date().addingTimeInterval(2 * 3600).timeIntervalSince1970 * 1000).rounded()),
            location: "Catedral"
        ),
    ]
}
