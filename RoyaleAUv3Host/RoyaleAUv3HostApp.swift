
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            AudioUnitBrowserView() // 👈 Use the view we created
        }
    }
}
