//
//  AddFriendViewController.swift
//  MoodTracker
//
//  Created by Nikolas Burk on 01/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol AddFriendViewControllerDelegate {
    func addFriend(friend: Friend)
}

class AddFriendViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    // MARK: Delegate
    var delegate: AddFriendViewControllerDelegate?
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        let friend = createFriendFromUI() // create friend based on UI elements
        delegate?.addFriend(friend: friend) // send friend to delegate
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        presentingViewController?.dismiss(animated: true)
    }
    
    
    // MARK: Helpers
    
    private func createFriendFromUI() -> Friend {
        let name = nameTextField.text!
        let mood: Mood
        switch moodSegmentedControl.selectedSegmentIndex {
        case 0: mood = .happy
        case 1: mood = .medium
        case 2: mood = .angry
        default: mood = .happy
        }
        return Friend(name: name, mood: mood)
    }
    
    
}
