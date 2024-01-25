import Models
import SwiftData
import SwiftUI

public struct ContentView: View {
  public init() {}

  public var body: some View {
    TabView {
      Group {
        VocaView()
          .tabItem {
            Label(
              "Voca",
              systemImage: "tray.and.arrow.down"
            )
          }
        SettingsView()
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
