import SwiftUI

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
    static let ferAzul = Color(hex: 0x17357F)
    static let ferGold = Color(hex: 0xF2B632)
    static let ferBackground = Color(hex: 0xF4F2FA)
    static let ferOnSurface = Color(hex: 0x14213D)
    static let ferMuted = Color(hex: 0x4A5370)
    static let ferOnGold = Color(hex: 0x0B1530)
}
