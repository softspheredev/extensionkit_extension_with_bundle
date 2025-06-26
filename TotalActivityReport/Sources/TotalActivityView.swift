//
//  TotalActivityView.swift
//  ActivityReportExtension
//
//  Created by Softsphere on 26/06/2025.
//

import SwiftUI

public struct TotalActivityView: View {
    public let totalActivity: String
    
    public init(totalActivity: String) {
        self.totalActivity = totalActivity
    }
    
    public var body: some View {
        Text(totalActivity)
            .padding(16)
            .background(.background, in: .rect(cornerRadius: 8))
            .background {
                Image(asset: TotalActivityReportAsset.mountains)
            }
    }
}

// In order to support previews for your extension's custom views, make sure its source files are
// members of your app's Xcode target as well as members of your extension's target. You can use
// Xcode's File Inspector to modify a file's Target Membership.
#Preview {
    TotalActivityView(totalActivity: "1h 23m")
}
