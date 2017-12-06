//
//  TimeViewController.swift
//  ReusablePopovers
//
//  Created by Ghouse Basha Shaik on 05/12/17.
//  Copyright © 2017 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTimeButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showPopover", sender: nil)
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showPopover" {
             let dateViewcontroller = segue.destination as! PopoverViewController
             dateViewcontroller.pickerType = "time"
             dateViewcontroller.onTimeSave = onTimeSave
         }
    }

    func onTimeSave(_ data: String) {
        timeLabel.text = data
    }
    

}
