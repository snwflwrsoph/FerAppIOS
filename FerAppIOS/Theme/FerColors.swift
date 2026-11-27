import SwiftUI
import UIKit

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

    init(light: UInt32, dark: UInt32) {
        self.init(UIColor { traits in
            let hex = traits.userInterfaceStyle == .dark ? dark : light
            return UIColor(
                red: CGFloat((hex >> 16) & 0xFF) / 255,
                green: CGFloat((hex >> 8) & 0xFF) / 255,
                blue: CGFloat(hex & 0xFF) / 255,
                alpha: 1
            )
        })
    }

    static let ferAzul = Color(light: 0x17357F, dark: 0x8DAAF2)
    static let ferAzulBarra = Color(hex: 0x17357F)
    static let ferGold = Color(hex: 0xF2B632)
    static let ferBackground = Color(light: 0xF4F2FA, dark: 0x0E1220)
    static let ferTarjeta = Color(light: 0xFFFFFF, dark: 0x1B2133)
    static let ferOnSurface = Color(light: 0x14213D, dark: 0xE8EAF2)
    static let ferMuted = Color(light: 0x4A5370, dark: 0xA3ABC4)
    static let ferOnGold = Color(hex: 0x0B1530)

    static let ferNavy = Color(hex: 0x142452)
    static let ferCeleste = Color(hex: 0xA4CBDE)
    static let ferTarjetaSeleccionada = Color(hex: 0xD9D9D9)
    static let ferDeshabilitado = Color(hex: 0xD0D5E0)
    static let ferBotones = Color(hex: 0xC6CFE8)  
}
