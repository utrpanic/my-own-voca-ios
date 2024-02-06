import Repositories
import SwiftData
import SwiftUI
import Features

@main
struct MyOwnVocaApp: App {
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([Item.self])
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
  }()

  var body: some Scene {
    return WindowGroup {
      ContentView()
    }
    .modelContainer(self.sharedModelContainer)
    .environment(\.viewFactory, self.viewFactory())
  }
  
  private func viewFactory() -> ViewFactory {
    
    return ViewFactory(
      addWordView: {
        return AddWordView()
      },
      settingsView: {
        return SettingsView()
      },
      vocaView: {
        return VocaView()
      }
    )
  }
}
