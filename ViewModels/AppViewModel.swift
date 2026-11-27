import SwiftUI
import Observation

private enum ClaveLocal {
    static let guardados = "saved_announcement_ids"
    static let conLike = "liked_announcement_ids"
    static let leidas = "read_announcement_ids"
    static let tamanoTexto = "tamano_texto"
    static let modoOscuro = "modo_oscuro"
}

@Observable
final class AppViewModel {
    var perfil: PerfilUsuario
    var announcements: [Announcement]
    private(set) var leidas: Set<String>
    private(set) var tamanoTexto: TamanoTexto
    private(set) var modoOscuro: Bool

    @ObservationIgnored private var idsGuardados: Set<String>
    @ObservationIgnored private var idsConLike: Set<String>
    private let defaults: UserDefaults

    init(
        perfil: PerfilUsuario = PerfilUsuario.cargar(),
        announcements: [Announcement] = Announcement.sample,
        defaults: UserDefaults = .standard
    ) {
        let guardados = Set(defaults.stringArray(forKey: ClaveLocal.guardados) ?? [])
        let conLike = Set(defaults.stringArray(forKey: ClaveLocal.conLike) ?? [])

        self.defaults = defaults
        self.perfil = perfil
        self.idsGuardados = guardados
        self.idsConLike = conLike
        self.leidas = Set(defaults.stringArray(forKey: ClaveLocal.leidas) ?? [])
        self.tamanoTexto = defaults.string(forKey: ClaveLocal.tamanoTexto)
            .flatMap { TamanoTexto(rawValue: $0) } ?? .normal
        self.modoOscuro = defaults.bool(forKey: ClaveLocal.modoOscuro)
        self.announcements = announcements.map { original in
            var anuncio = original
            anuncio.isSaved = guardados.contains(anuncio.id)
            if conLike.contains(anuncio.id) {
                anuncio.isLikedByUser = true
                anuncio.likes += 1
            }
            return anuncio
        }
    }

    var featured: Announcement? {
        announcements.first { $0.isFeatured }
    }

    var others: [Announcement] {
        announcements.filter { $0.id != featured?.id }
    }

    var saved: [Announcement] {
        announcements.filter { $0.isSaved }
    }

    func announcement(id: String) -> Announcement? {
        announcements.first { $0.id == id }
    }

    func toggleSave(id: String) {
        guard let i = announcements.firstIndex(where: { $0.id == id }) else { return }
        announcements[i].isSaved.toggle()
        if announcements[i].isSaved {
            idsGuardados.insert(id)
        } else {
            idsGuardados.remove(id)
        }
        defaults.set(Array(idsGuardados), forKey: ClaveLocal.guardados)
    }

    func toggleLike(id: String) {
        guard let i = announcements.firstIndex(where: { $0.id == id }) else { return }
        announcements[i].isLikedByUser.toggle()
        if announcements[i].isLikedByUser {
            announcements[i].likes += 1
            idsConLike.insert(id)
        } else {
            announcements[i].likes -= 1
            idsConLike.remove(id)
        }
        defaults.set(Array(idsConLike), forKey: ClaveLocal.conLike)
    }

    func marcarLeida(id: String) {
        guard !leidas.contains(id) else { return }
        leidas.insert(id)
        defaults.set(Array(leidas), forKey: ClaveLocal.leidas)
    }

    func cambiarTamanoTexto(_ tamano: TamanoTexto) {
        tamanoTexto = tamano
        defaults.set(tamano.rawValue, forKey: ClaveLocal.tamanoTexto)
    }

    func cambiarModoOscuro(_ activado: Bool) {
        modoOscuro = activado
        defaults.set(activado, forKey: ClaveLocal.modoOscuro)
    }
}
