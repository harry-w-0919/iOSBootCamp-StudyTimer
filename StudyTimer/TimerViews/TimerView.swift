import SwiftUI

struct TimerView: View {
    @State private var hours = ""
    @State private var minutes = ""
    @State private var remainingSec = 0
    @State private var totalSec = 0
    @State private var timer: Timer? = nil
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("time")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            
            
            Text("The Study Timer")
                .font(.largeTitle)
                .padding(.horizontal)
                .bold()
            
            Text("Set a focus timer to help you stay on task.")
                .padding(.horizontal)
                .font(.title3)
            
            HStack {
                Spacer()
                
                TextField("hours", text: $hours)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                Text(":")
                TextField("minutes", text: $minutes)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                
                Spacer()
            }
            .padding()
            
            HStack {
                Spacer()
                Button("Start Timer") {
                    timerFunc()
                }
                .padding()
                .alert(
                    "Time's up.",
                    isPresented: $showAlert
                ) {
                    Button("OK", role: .cancel){}
                }
                Spacer()
            }
            
            if totalSec > 0 {
                HStack {
                    Text("\(Int(totalSec - remainingSec))")
                        .bold()
                    Text("sec /")
                    Text("\(Int(totalSec))")
                        .bold()
                    Text("sec")
                }
                .padding(.horizontal)
                
                ProgressView(value: Double(totalSec - remainingSec),
                             total: Double(totalSec))
                .scaleEffect(x: 1, y: 2)
                .padding()
            }
            
            Spacer()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func timerFunc() {
        let h = Int(hours) ?? 0
        let min = Int(minutes) ?? 0
        
        totalSec = h * 3600 + min * 60
        guard totalSec > 0 else {
            return
        }
        
        remainingSec = totalSec
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { timer in
            if remainingSec > 0 {
                remainingSec -= 1
            } else {
                self.timer?.invalidate()
                self.timer = nil
                showAlert = true
                remainingSec = 0
            }
        }
    }
}

#Preview {
    TimerView()
}
