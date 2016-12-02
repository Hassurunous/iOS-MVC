//
//  MoodTableViewController.swift
//  MoodTracker
//
//  Created by Nikolas Burk on 01/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class MoodTableViewController: UITableViewController, FriendTableViewCellDelegate, AddFriendViewControllerDelegate {

  var friends: [Friend] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Moody Friends" // set the title in the navigation bar
  }
  
  
  // MARK: Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friends.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
    let friend = friends[indexPath.row]
    cell.friend = friend // this triggers the didSet in FriendTableViewCell and configures the cell's UI
    cell.delegate = self // make sure FriendTableViewCell can talk to MoodTableViewController
    return cell
  }
  
  
  // MARK: Public methods
  
  func updateFriend(friend: Friend) {
    let mood = nextMood(mood: friend.mood)
    friend.mood = mood // update model
    tableView.reloadData() // update view
  }
  
  func addFriend(friend: Friend) {
    friends.append(friend) // update model
    tableView.reloadData() // update view
  }
  
  
  // MARK: Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let addFriendViewController = segue.destination as! AddFriendViewController
    addFriendViewController.delegate = self  // make sure AddFriendViewController can talk to MoodTableViewController
  }
  
  
  // MARK: Helpers
  
  func nextMood(mood: Mood) -> Mood {
    switch mood {
    case .angry: return .medium
    case .medium: return .happy
    case .happy: return .angry
    }
  }
}



