//
//  PermisosScreen.swift
//  FerAppIOS
//
//  Created by MAC on 25/11/26.
//

import SwiftUI

struct PermisosScreen: View {
    var body: some View {
        NavigationStack {
            Text("Permisos")
                .multilineTextAlignment(.center)
                .bold()
                .font(.largeTitle)
                .padding()
            ScrollView {
                HStack {
                    VStack {
                        Text("Notificaciones")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.title2)
                        Text("Modificar el estado del permiso de notificaciones")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.body)
                    }
                    Image(systemName: "chevron.right")
                }
                Divider()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(30)
        }
    }
}

#Preview {
    PermisosScreen()
}
