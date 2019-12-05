//
//  Analytics.swift
//  ViewAnalytics
//
//  Created by Uday Pandey on 05/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import SwiftUI

struct Analytics {
    func track(_ screen: String) {
        print("Analytics: Tracking: \(screen)")
    }
}

struct AnalyticsKey: EnvironmentKey {
    static let defaultValue: Analytics = Analytics()
}

extension EnvironmentValues {
    var analytics: Analytics {
        get {
            return self[AnalyticsKey.self]
        }
        set {
            self[AnalyticsKey.self] = newValue
        }
    }
}
