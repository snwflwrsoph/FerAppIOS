//
//  Announcement.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//

enum AnnouncementCategory : String {
    case ANNIVERSARY = "80 aniversario"
    case CALL = "Convocatoria"
    case STORIES = "Historias"
    case ALLIANCES = "Alianzas"
    case EVENTS = "Eventos"
    case GENERAL = "Anuncio"
}

struct Announcement: Identifiable {
    let id: String
    let title: String
    let summary: String
    let description: String
    let author: String
    let date: String
    let category: AnnouncementCategory
    let profile: String
    let mainImage: String
    let secondaryImage: String?
    let tertiaryImage: String?
    let likes: Int
    let isLikedByUser: Bool
    let eventStartMillis: Int64?
    let eventEndMillis: Int64?
    let location: String?
}

