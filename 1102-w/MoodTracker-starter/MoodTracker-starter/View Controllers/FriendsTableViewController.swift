//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    static let happyString = "Oh happy day..."
    static let angryString = "Get off my lawn!!!"
    static let mediumString = "Well, I don't really care."
    
    var friendArray = [
        Friend(name: "John", mood: .happy),
        Friend(name: "Jack", mood: .medium),
        Friend(name: "Sarah", mood: .happy),
        Friend(name: "Jenny", mood: .happy)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        
        //Fill in each cell with friend information
        let friend = friendArray[indexPath.row]
        cell.friend = friend
        cell.nameLabel.text = friend.name
        cell.moodButton.setTitle(friend.mood.rawValue, for: .normal)
        switch friend.mood.rawValue {
        case "😁":
            cell.moodDescriptionLabel.text = FriendsTableViewController.happyString
        case "😑":
            cell.moodDescriptionLabel.text = FriendsTableViewController.mediumString
        case "😡":
            cell.moodDescriptionLabel.text = FriendsTableViewController.angryString
        default:
            cell.moodDescriptionLabel.text = FriendsTableViewController.happyString
        }
        cell.friendTable = self
        
        return cell
    }
    
    func updateFriend(friend: Friend, newMood: Mood) {
        friend.mood = newMood
        tableView.reloadData()
        for friend in friendArray {
            print("\(friend.name):\(friend.mood.rawValue)")
        }
        print(#function, #line, friendArray)
    }
    
    func addFriend(friend: Friend) {
        friendArray.append(friend)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function, #line, "Segue activated...")
        let addFriendViewController = segue.destination as! AddFriendViewController
        addFriendViewController.friendsTable = self
    }
}
