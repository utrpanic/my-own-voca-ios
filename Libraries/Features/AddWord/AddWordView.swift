import Models
import SwiftUI

public struct AddWordView: View {
  @State private var word: String = ""
  @State private var source: String = ""
  @State private var startDate = Date()
  @State private var endDate = Date()

  @FocusState private var focused: Bool?

  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext

  public init() {}

  private func onDoneTap() {
    let word = Word(text: self.word, histories: [
      History(from: self.source, addedAt: Date()),
    ])
    self.modelContext.insert(word)
  }

  public var body: some View {
    return Form {
      Section(header: Text("Word")) {
        Group {
          TextField("Enter word here…", text: self.$word)
            .focused(self.$focused, equals: true)
            .onAppear {
              self.focused = true
            }
        }
      }
      Section(header: Text("From Where")) {
        Group {
          TextField("Enter source here…", text: self.$source)
        }
      }
    }

    .navigationTitle("Add Word")
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Dismiss") {
          self.dismiss()
        }
      }
      ToolbarItem(placement: .primaryAction) {
        Button("Done") {
          self.onDoneTap()
          self.dismiss()
        }
        .disabled(self.word.isEmpty)
      }
    }
  }
}
