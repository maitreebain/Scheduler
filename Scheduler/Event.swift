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
    let eventNames = ["Review UITableView lesson and videos", "CocoaPods Peer Lab", "Unit Assessment", "iOS Soho Meetup", "112 miles birthday bike ride 🥳", "Ladies who code", "facebook", "iOS Study Group", "Redo BlackJack Project for OOP practice", "Preview Unit 3 over the weekend"]
    var events = [Event]()
    for eventName in eventNames {
      let event = Event(date: Date(), name: eventName)
      events.append(event)
    }
    return events
  }
}
