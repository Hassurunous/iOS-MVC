//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    // MARK: Defining variables and outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    var friendsTable: FriendsTableViewController!
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: Actions
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        // TODO: save the added friend here
        let friend: Friend!
        let friendName = nameTextField.text!
        let friendMood: Mood!
        switch moodSegmentedControl.selectedSegmentIndex {
        case 0:
            friendMood = .happy
        case 1:
            friendMood = .medium
        case 2:
            friendMood = .angry
        default:
            print(#function, #line, #file, "Switch defaulted.")
            friendMood =  nil
        }
        friend = Friend(name: friendName, mood: friendMood)
        if friendName != "" {
            friendsTable.addFriend(friend: friend)
        }
        friendsTable.tableView.reloadData()
        dismissViewController()
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        dismissViewController()
    }
    
    // MARK: Helpers
    
    func dismissViewController() {
        presentingViewController?.dismiss(animated: true)
    }
    
}
