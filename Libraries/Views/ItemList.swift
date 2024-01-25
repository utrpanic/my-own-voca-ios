import Models
import SwiftData
import SwiftUI

public struct ItemList: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]

  public init() {}

  public var body: some View {
    NavigationSplitView {
      List {
        ForEach(self.items) { item in
          NavigationLink {
            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
          } label: {
            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
          }
        }
        .onDelete(perform: self.deleteItems)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem {
          Button(action: self.addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    } detail: {
      Text("Select an item")
    }
  }

  private func addItem() {
    withAnimation {
      let newItem = Item(timestamp: Date())
      self.modelContext.insert(newItem)
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        self.modelContext.delete(self.items[index])
      }
    }
  }
}

#Preview {
  ItemList()
    .modelContainer(for: Item.self, inMemory: true)
}
