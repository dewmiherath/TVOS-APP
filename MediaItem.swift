import Foundation

// Data model for media items
struct MediaItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}
