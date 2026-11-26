//
//  ContentView.swift
//  FerAppIOS
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct NewsDetailView: View {
    let announcement: Announcement
    var onBack: () -> Void = {}
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                
                // fila de botones de navegación
                HStack{
                    Button(action: onBack) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                // imagen principal
                Image(announcement.mainImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                
                // Título
                Text(announcement.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Fila de datos de publicación
                HStack(spacing: 12){
                    // Imagen de perfil
                    Image(announcement.profile)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height:50)
                    //Spacer()
                    
                    // Autor
                    Text(announcement.author)
                        .foregroundStyle(.secondary)
                        
                    Spacer()
                    
                    // Fecha
                    Text(announcement.date)
                        .foregroundStyle(.secondary)
                }
                
                // Texto
                Text(announcement.description)
                
                // Fotos extra
                if let secondaryImage = announcement.secondaryImage {
                    HStack{
                        // imagen secundaria
                        Image(secondaryImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                        if let tertiaryImage = announcement.tertiaryImage {
                            Spacer()
                            Image(tertiaryImage)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                        }
                    }
                }
                
                // Fila de interaccion
                HStack(spacing: 12){
                    Button(action: onBack) {
                        Image(systemName: "heart")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    Text(String(announcement.likes))
                    Button(action: onBack) {
                        Image(systemName: "calendar")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.secondarySystemFill))
                            .clipShape(Circle())
                    }
                    Text("Agregar a calendario")
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    NewsDetailView(announcement: AnnouncementsViewModel().announcements[0])
}
