//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayTodoViewController: UIViewController {
    
    var todo: Todo?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = ""
        contentTextView.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let todo = todo {
            titleTextField.text = todo.title
            contentTextView.text = todo.content
        }
        else {
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let destination = segue.destination as? ListTodoTableViewController else {return}
        
        switch identifier {
        case "save" where todo != nil:
            todo?.title = titleTextField.text ?? ""
            todo?.content = contentTextView.text ?? ""
            
            destination.tableView.reloadData()
        case "save" where todo == nil:
            let todo = Todo()
            todo.title = titleTextField.text ?? ""
            todo.content = contentTextView.text ?? ""
            
            todo.modificationTime = Date()
            
            destination.todos.append(todo)
        
        case "cancel" :
            print("Cancel bar button item tapped")
            
        default :
            print("Unexpected segue")
        }
        
    }
    
}
