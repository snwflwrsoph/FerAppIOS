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
            NewsDetailView(announcement: AnnouncementsViewModel().announcements[0])
        }
    }
}
