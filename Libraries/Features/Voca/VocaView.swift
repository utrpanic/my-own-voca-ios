import SwiftUI

public struct VocaView: View {
  @State private var showAddWord: Bool = false

  @Environment(\.viewFactory) private var viewFactory;

  public init() {}

  public var body: some View {
    NavigationStack {
      Group {
        Text("VocaView")
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
          self.viewFactory.addWordView()
        }
        .presentationDetents([.medium])
      }
    }
  }
}
