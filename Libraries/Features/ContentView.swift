import Repositories
import SwiftData
import SwiftUI

public struct ContentView: View {
  @Environment(\.viewFactory) private var viewFactory

  public init() {}

  public var body: some View {
    TabView {
      Group {
        self.viewFactory.vocaView()
          .tabItem {
            Label(
              "Voca",
              systemImage: "tray.and.arrow.down"
            )
          }
        self.viewFactory.settingsView()
          .tabItem {
            Label(
              "Settings",
              systemImage: "gearshape"
            )
          }
      }
      .toolbarBackground(.visible, for: .tabBar)
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
