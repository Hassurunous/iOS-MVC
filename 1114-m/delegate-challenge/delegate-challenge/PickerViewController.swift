//
//  PickerViewController.swift
//  delegate-challenge
//
//  Created by Nikolas Burk on 07/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var cityLabel: UILabel!
    
    let cities = ["New York", "San Francisco", "Berlin", "Hamburg", "Paris"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        cityLabel.text = cities[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print(#file, #function, #line)
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(#file, #function, #line)
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(#file, #function, #line)
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(#file, #function, #line)
        cityLabel.text = cities[row]
    }
    
}
