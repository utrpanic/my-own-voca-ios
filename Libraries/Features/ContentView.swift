import Models
import SwiftData
import SwiftUI

public struct ContentView: View {
  @Environment(\.router) private var router

  public init() {}

  public var body: some View {
    TabView {
      Group {
        self.router.vocaView()
          .tabItem {
            Label(
              "Voca",
              systemImage: "tray.and.arrow.down"
            )
          }
        self.router.settingsView()
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
    .modelContainer(for: [Word.self, Item.self], inMemory: true)
}
