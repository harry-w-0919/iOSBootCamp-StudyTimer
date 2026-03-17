import SwiftUI
import SwiftData

@main
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
