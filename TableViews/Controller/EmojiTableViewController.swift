//
//  EmojiTableViewController.swift
//  TableViews
//
//  Created by Sergey Lukaschuk on 03.08.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // MARK: - Property
    var cellManager = CellManager()
    var dataManager = DataManager()
    var emojis: [Emoji]! {
        didSet {
            dataManager.saveEmojis(emojis)
        }
    }
//    var editEmoji = Emoji()

    // MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = dataManager.loadAll() ?? Emoji.loadDefault()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add/Edit" {
        guard let addEditTVC = segue.destination as? AddEditTableViewController else { fatalError() }
        guard let index = tableView.indexPathForSelectedRow?.row else { fatalError() }
        let emoji = emojis[index]
        addEditTVC.emoji = emoji
        }
    }
    
    // MARK: - IBAction
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "SaveButton" {
            let source = unwindSegue.source as! AddEditTableViewController
            if source.emoji.symbol != "" && source.emoji.name != "" && source.emoji.description != "" {
                emojis.append(source.emoji)
                tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension EmojiTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiTableViewCell", for: indexPath) as! EmojiTableViewCell
        cellManager.configure(cell, with: emoji)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(moveEmoji, at: destinationIndexPath.row)
    }
}

// MARK: UITableViewDelegate
extension EmojiTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
