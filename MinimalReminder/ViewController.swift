//
//  ViewController.swift
//  MinimalReminder
//
//  Created by Theo Vora on 6/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let availableTimes: [MRTimes] = [.sec15, .sec30, .min1]
    
    // MARK: - Outlets

    @IBOutlet weak var TimesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var currentReminderLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<availableTimes.count {
            TimesSegmentedControl.setTitle(("\(availableTimes[i])"), forSegmentAt: i)
        }
    }
    
    @IBAction func setReminderButtonTapped(_ sender: Any) {
        currentReminderLabel.text = "You tapped?"
    }
}

