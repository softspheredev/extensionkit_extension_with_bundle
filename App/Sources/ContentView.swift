import DeviceActivity
import FamilyControls
import SwiftUI
import TotalActivityReport

public struct ContentView: View {
    @State var screenTimeAuthorized = false
    @ObservedObject var authorizationCenter = AuthorizationCenter.shared

    public init() {}

    public var body: some View {
        if authorizationCenter.authorizationStatus == .approved {
            DeviceActivityReport(.totalActivity)
        } else {
            Button("Give access to ScreenTime") {
                Task {
                    try? await authorizationCenter.requestAuthorization(for: .individual)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
