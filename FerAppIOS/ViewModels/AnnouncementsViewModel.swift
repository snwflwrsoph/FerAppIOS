//
//  AnnouncementsViewModel.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//

import Foundation
import Observation

@Observable
class AnnouncementsViewModel {
    var announcements: [Announcement] = []
    
    init() {
        loadAnnouncements()
    }
    
    func loadAnnouncements() {
        announcements = [
            Announcement(
                id: "1",
                title: "80 Aniversario FER",
                summary: "Gran anuncio sobre el evento del 80 aniversario de Fundación Esposos Rodríguez wuuuuu!!!!",
                description: "Se llevará acabo un super mega evento para celebrar nuestro aniversario. Todos los becarios están invitados!!!",
                author: "Comunicación FER",
                date: "24 de noviembre del 2026",
                category: AnnouncementCategory.ANNIVERSARY,
                profile: "logofer",
                mainImage: "aniversario1",
                secondaryImage: "aniversario2",
                tertiaryImage: "aniversario3",
                likes: 67,
                isLikedByUser: false,
                eventStartMillis: Int64((Date().timeIntervalSince1970 * 1000).rounded()),
                eventEndMillis: Int64((Date().addingTimeInterval(2*3600).timeIntervalSince1970 * 1000).rounded()),
                location: "Catedral")
        ]
    }
}
