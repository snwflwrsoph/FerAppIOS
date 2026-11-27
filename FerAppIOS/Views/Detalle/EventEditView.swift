//
//  EventEditView.swift
//  FerAppIOS
//
//  Created by MAC on 26/11/26.
//

// snwflwrsoph

import SwiftUI
import EventKit
import EventKitUI

struct EventEditView: UIViewControllerRepresentable {
    let eventStore: EKEventStore
    let announcement: Announcement
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let event = EKEvent(eventStore: eventStore)
        event.title = announcement.title
        event.notes = announcement.summary
        event.location = announcement.location
        event.startDate = announcement.eventStartDate ?? Date()
        event.endDate = announcement.eventEndDate ?? Date().addingTimeInterval(3600)
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        let controller = EKEventEditViewController()
        controller.eventStore = eventStore
        controller.event = event
        controller.editViewDelegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }
    
    final class Coordinator: NSObject, EKEventEditViewDelegate {
        @Binding var isPresented: Bool
        init(isPresented: Binding<Bool>) {_isPresented = isPresented}
        
        func eventEditViewController(_ controller: EKEventEditViewController,
                                     didCompleteWith action: EKEventEditViewAction){
            isPresented = false
        }
    }
}
