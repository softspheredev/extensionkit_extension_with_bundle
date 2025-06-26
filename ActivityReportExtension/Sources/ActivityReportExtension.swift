//
//  ActivityReportExtension.swift
//  ActivityReportExtension
//
//  Created by Softsphere on 26/06/2025.
//

import DeviceActivity
import SwiftUI
import TotalActivityReport

@main
struct ActivityReportExtension: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
