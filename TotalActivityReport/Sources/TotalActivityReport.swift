//
//  TotalActivityReport.swift
//  ActivityReportExtension
//
//  Created by Softsphere on 26/06/2025.
//

import DeviceActivity
import SwiftUI

public extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("Total Activity")
}

public struct TotalActivityReport: DeviceActivityReportScene {
    // Define which context your scene will represent.
    public let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    public let content: (String) -> TotalActivityView
    
    public init(content: @escaping (String) -> TotalActivityView) {
        self.content = content
    }
    
    public func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> String {
        // Reformat the data into a configuration that can be used to create
        // the report's view.
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        return formatter.string(from: totalActivityDuration) ?? "No activity data"
    }
}
