import SwiftUI
import Combine
final class FeedViewModel: ObservableObject {
    @Published var announcements: [Announcement] = Announcement.sample

    var featured: Announcement? {
        announcements.first { $0.isFeatured }
    }

    var others: [Announcement] {
        announcements.filter { $0.id != featured?.id }
    }   

    func toggleSave(_ announcement: Announcement) {
        guard let i = announcements.firstIndex(where: { $0.id == announcement.id }) else { return }
        announcements[i].isSaved.toggle()
    }
}
