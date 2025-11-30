import SwiftUI

struct ProgressBar: View {
    let progress: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Int(progress * 100))% Completed")
                Spacer()
            }
            ProgressView(value: progress, total: 1.0)
                .scaleEffect(x: 1, y: 2)
        }
        .progressViewStyle(BorderedProgressViewStyle())
    }
}


struct BorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
    }
}
