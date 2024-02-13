import Features
import Models
import SwiftData
import SwiftUI

@main
struct MyOwnVocaApp: App {
  var body: some Scene {
    return WindowGroup {
      ContentView()
    }
    .modelContainer(self.modelContainer())
    .environment(\.router, self.router())
  }

  private func modelContainer() -> ModelContainer {
    let schema = Schema([Word.self, History.self, Item.self])
    let modelConfiguration = ModelConfiguration(
      schema: schema,
      isStoredInMemoryOnly: false
    )
    do {
      return try ModelContainer(
        for: schema,
        configurations: [modelConfiguration]
      )
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }

  private func router() -> Router {
    return Router(
      addWordView: { AddWordView() },
      settingsView: { SettingsView() },
      vocaView: { VocaView() },
      wordDetailView: { word in WordDetailView(word) }
    )
  }
}
