import SwiftUI

public struct SettingsView: View {
  public init() {}

  public var body: some View {
    NavigationStack {
      Group {
        Text("SettingsView")
      }
      .toolbarBackground(.visible, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Settings")
    }
  }
}
