import Models
import SwiftData
import SwiftUI

public struct VocaView: View {
  @Query public var words: [Word]

  @State private var showAddWord: Bool = false

  @Environment(\.router) var router
  @Environment(\.modelContext) var modelContext

  public init() {}

  private func onDeleteWord(at indexSet: IndexSet) {
    withAnimation {
      for item in indexSet {
        let word = self.words[item]
        self.modelContext.delete(word)
      }
    }
  }

  public var body: some View {
    NavigationStack {
      Group {
        List {
          ForEach(self.words) { word in
            NavigationLink {
              self.router.wordDetailView(word)
            } label: {
              Text("Item at \(word.text)")
            }
          }
          .onDelete(perform: self.onDeleteWord)
        }
        EmptyView()
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("My Own Voca")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            self.showAddWord = true
          } label: {
            Label("Add Word", systemImage: "plus")
          }
        }
      }
      .sheet(isPresented: self.$showAddWord) {
        NavigationStack {
          self.router.addWordView()
        }
        .presentationDetents([.medium])
      }
    }
  }
}
