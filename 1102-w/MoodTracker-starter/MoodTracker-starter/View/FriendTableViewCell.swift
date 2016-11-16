//
//  FriendTableViewCell.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
  
    // MARK: Table Cell Var declerations
    var friendTable: FriendsTableViewController!
    
    // MARK: Table Cell Outlet declerations
    @IBOutlet weak var moodDescriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moodButton: UIButton!
    
    var friend: Friend? {   // stores the friend that is displayed in this cell
        didSet {
            nameLabel.text = friend!.name
            moodButton.setTitle(friend!.mood.rawValue, for: .normal)
        }
    }
    
    @IBAction func moodButtonPressed(_ sender: UIButton) {
        print(#line, #function)
        let newMood = getNewMood(mood: friend!.mood)
        friendTable.updateFriend(friend: friend!, newMood: newMood)
    }
    
    func getNewMood(mood: Mood) -> Mood {
        switch mood {
        case .happy:
            return .medium
        case .medium:
            return .angry
        case .angry:
            return .happy
        }
    }
}
