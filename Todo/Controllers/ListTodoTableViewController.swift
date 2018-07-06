//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListTodoTableViewController: UITableViewController {
    
    var todos = [Todo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "still need to complete"
        case 1:
            return "completed"
        default:
            return ""
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTodoTableViewCell", for: indexPath) as! ListTodoTableViewCell
        let todo = todos[indexPath.row]
        
        cell.todoDescriptionLabel.text = todo.content
        cell.todoTitleLabel.text = todo.title
        cell.todoTimeStampLabel.text = todo.modificationTime?.convertToString() ?? "unknown"
        return cell
    }
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        switch identifier {
        case "displayTodo":
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let todo = todos[indexPath.row]
            
            let destination = segue.destination as! DisplayTodoViewController
            
            destination.todo = todo
            
        case "addTodo":
            print("Add Todo")
        default:
            break
        }
    }
}
