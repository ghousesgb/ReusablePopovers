//
//  ViewController.swift
//  ReusablePopovers
//
//  Created by Ghouse Basha Shaik on 05/12/17.
//  Copyright © 2017 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    var pickerType: String?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: pickerView.date)
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: pickerView.date)
    }
    
    var onTimeSave: ((_ date: String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pickerType == "date" {
            pickerView.datePickerMode = .date
            titleLabel.text = "Select Date"
            
        }else {
            pickerView.datePickerMode = .time
            titleLabel.text = "Select Time"
        }
    }
    
    @IBAction func saveButtonActon(_ sender: UIButton) {
        if let onTimeSave = onTimeSave {
            onTimeSave(formattedTime)
        }else {
            NotificationCenter.default.post(name: .saveDateTime, object: self)
        }
        
        dismiss(animated: true)
    }
    
}

