import SwiftUI
import SwiftData
import Foundation

struct Quote: Codable {
    let q: String
    let a: String
}

class getQuote {
    static func fetchQuote() async throws -> Quote {
        let url = URL(string: "https://zenquotes.io/api/random")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Quote].self, from: data)
        return result.first!
    }
}

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(
        title: "Tasks",
        items: [
            Reminder(title: "Sample task 1"),
            Reminder(title: "Sample task 2"),
            Reminder(title: "Sample task 3")
        ]
    )
    @State private var newTask: String = ""
    @State var quote: Quote? = nil
    
    @State private var showQuoteAlert = false
    @State private var quoteText = ""
    
    var progress: Double {
        let total = page.items.count
        let done = page.items.filter { $0.isCompleted }.count
        if total == 0 {
            return 0
        } else {
            return Double(done) / Double(total)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome!")
                .font(.largeTitle)
                .padding(.horizontal)
                .bold()
            
            Text("You may add some tasks and begin to work on them.")
                .padding(.horizontal)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .alert("Progress for Now", isPresented: $showQuoteAlert) {
            Button("OK") { }
        } message: {
            Text(quoteText)
        }
        
        VStack(alignment: .leading) {
            Text("Tasks for Today")
                .font(.title2)
                .padding(.horizontal)
                .foregroundStyle(.blue)
                .bold()
            
            ProgressBar(progress: progress)
                .padding()
                .onChange(of: progress, initial: false) { oldState, newState in
                    if oldState < 0.5 && newState >= 0.5 {
                        Task {
                            do {
                                let quote = try await getQuote.fetchQuote()
                                let _title = "You're halfway there.\n\n"
                                let _quote = "\"" + quote.q + "\"\n"
                                let _author = "- " + quote.a
                                quoteText = _title + _quote + _author
                            } catch {
                                quoteText = "You're halfway there."
                            }
                            showQuoteAlert = true
                        }
                    }
                    else if oldState < 1 && newState == 1 {
                        Task {
                            do {
                                let quote = try await getQuote.fetchQuote()
                                let _title = "Congratulations! You've finished your task.\n\n"
                                let _quote = "\"" + quote.q + "\"\n"
                                let _author = "- " + quote.a
                                quoteText = _title + _quote + _author
                            } catch {
                                quoteText = "Congratulations! You've finished your task."
                            }
                            showQuoteAlert = true
                        }
                    }
                }
            
            List {
                ForEach($page.items) { $reminder in
                    HStack {
                        Button {
                            reminder.isCompleted.toggle()
                        } label: {
                            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                        
                        TextField("New task...", text: $reminder.title)
                            .strikethrough(reminder.isCompleted)
                            .foregroundColor(reminder.isCompleted ? .gray : .primary)
                        
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            page.items.append(Reminder(title: ""))
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 44))
                        }
                        .padding()
                    }
                }
            )
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
