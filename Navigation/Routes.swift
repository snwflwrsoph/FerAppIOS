import Foundation

enum FeedRoute: Hashable {
    case detalle(id: String)
    case busqueda
    case notificaciones
}

enum AjustesRoute: Hashable {
    case tamanoTexto
    case permisos
}
