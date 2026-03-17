import SwiftUI
import SwiftData

@main
// main struct.
struct StudyTimerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Tasks", systemImage: "house") {
                    ContentView()
                }
                Tab("Timer", systemImage: "timer") {
                    TimerView()
                }
            }
        }
    }
}
