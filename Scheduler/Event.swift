//
//  Event.swift
//  Scheduler
//
//  Created by Maitree Bain on 11/20/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct Event {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        var events = [Event]()
        
        var eventNames = ["Code", "Unit Assesment", "iOS Soho", "Births 112 milke bike ride", "Ladies night out"]
        
        for eventName in eventNames {
            let event = Event(date: Date(), name: eventName)
            events.append(event)
        }
        
        return events
    }
}
