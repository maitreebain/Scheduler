//
//  ViewController.swift
//  Scheduler
//
//  Created by Maitree Bain on 11/20/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //data - an array of events
    var events = [Event]()
    
    var isEditingTableView = false {
        didSet { //property observer
            tableView.isEditing = isEditingTableView
            
            //toggle bar button item's title between "Edit" and "Done"
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        events = Event.getTestData()
    }

@IBAction func addNewEvent(for segue: UIStoryboardSegue) {
    //caveman debugging
    
    //get a reference to the CreateEventController
    guard let createEventController = segue.source as? CreateEventController,
        let createdEvent = createEventController.event else {
        fatalError("failed to access CreateEventController")
    }
    
    //insert into our events array
    //1. Update the data model e.g update the events array
    events.insert(createdEvent, at: 0)//or events.endIndex
    
    //create an indexPath to be inserted into the table view
    let indexPath = IndexPath(row: 0, section: 0) //top of table view
    
    //2. we need to update the table view
    //use indexPath to insert into table view
    tableView.insertRows(at: [indexPath], with: .automatic)
}
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
        isEditingTableView.toggle() //changes a boolean value
    }
    
    
    
}

extension ScheduleListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.date.description
        
        return cell
    }
    
    //MARK: - Deleting rows in a table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .insert:
            // only gets called if "insertion control" exists and gets selected
            print("inserting...")
        case .delete:
            print("deleting")
            //1. remove item from the data model e.g events
            events.remove(at: indexPath.row) //remove event from the events array
            
            //2. update the table view
            tableView.deleteRows(at: [indexPath], with: .automatic )
            
        default:
            print(".....")
        }
    }
    
    //MARK: - reordering rows in a table view
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let eventToMove = events[sourceIndexPath.row] //save the event being moved
        
        events.remove(at: sourceIndexPath.row)
        events.insert(eventToMove, at: destinationIndexPath.row)
    }
}
