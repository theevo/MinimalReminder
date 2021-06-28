//
//  ViewController.swift
//  MinimalReminder
//
//  Created by Theo Vora on 6/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let availableTimes: [MRTimes] = [.sec30, .min1, .min2]
    
    // MARK: - Outlets

    @IBOutlet weak var TimesSegmentedControl: UISegmentedControl!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<availableTimes.count {
            TimesSegmentedControl.setTitle(("\(availableTimes[i])"), forSegmentAt: i)
        }
    }
}

