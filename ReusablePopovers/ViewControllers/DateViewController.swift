//
//  DateViewController.swift
//  ReusablePopovers
//
//  Created by Ghouse Basha Shaik on 05/12/17.
//  Copyright © 2017 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*NotificationCenter.default.addObserver(forName: .saveDateTime, object: self, queue: nil) {[unowned self] (notification) in
            let popOverController = notification.object as! PopoverViewController
            self.dateLabel.text = popOverController.formattedDate
        }*/
        NotificationCenter.default.addObserver(self, selector: #selector(handleSaveDate), name: .saveDateTime, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .saveDateTime, object: nil)
        super.viewDidDisappear(animated)
    }
    @objc func handleSaveDate(notification: Notification) {
        let popOverController = notification.object as! PopoverViewController
        dateLabel.text = popOverController.formattedDate
    }
    @IBAction func addDateButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showPopover", sender: nil)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let dateViewcontroller = segue.destination as! PopoverViewController
            dateViewcontroller.pickerType = "date"
        }
    }
}
