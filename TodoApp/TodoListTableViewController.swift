//
//  ViewController.swift
//  TodoApp
//
//  Created by Artem Martus on 8/29/19.
//  Copyright © 2019 Artem Martus. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var items = ["one","two","three"] {
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
    }
    @IBAction func addTodoItem(_ sender: UIBarButtonItem) {
        var textField: UITextField?

        let alert = UIAlertController(title: "Adding new item to list", message: "Fill in item's name and press add button", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default){
            [weak self](a) in
            if let tf = textField, let text = tf.text , !text.isEmpty{
                self?.items.append(text)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addTextField { (tf) in
            textField = tf
            tf.placeholder = "New item name in here"
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true)
    }
    
}

