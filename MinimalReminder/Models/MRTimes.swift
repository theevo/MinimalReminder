//
//  MRTimes.swift
//  MinimalReminder
//
//  Created by Theo Vora on 6/28/21.
//

import Foundation

enum MRTimes: Int {
    case sec30 = 30
    case min1 = 60
    case min2 = 120
}

extension MRTimes: CustomStringConvertible {
    var description: String {
        switch self {
        case .sec30:
            return "30 sec"
        case .min1:
            return "1 min"
        case .min2:
            return "2 min"
        }
    }
}
