import SwiftUI

public struct VocaView: View {
  public init() {}

  public var body: some View {
    NavigationStack {
      Group {
        Text("VocaView")
      }
      .toolbarBackground(.visible, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Voca")
    }
  }
}
