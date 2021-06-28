//
//  ViewController.swift
//  MinimalReminder
//
//  Created by Theo Vora on 6/28/21.
//

import UserNotifications
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
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            // Enable or disable features based on the authorization.
            
            if granted {
                print("yay")
            } else {
                print("nay")
            }
        }
        
        let selectedTimeIndex = TimesSegmentedControl.selectedSegmentIndex
        let selectedTime = availableTimes[selectedTimeIndex]
        
        let content = UNMutableNotificationContent()
        content.title = "Time's up"
        content.body = "It's been \(selectedTime)"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: selectedTime.rawValue,
            repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print("Error creating request. Details: \(error)")
            }
        }
    }
}

