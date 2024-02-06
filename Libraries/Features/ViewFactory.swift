import SwiftUI

public struct ViewFactory: EnvironmentKey {
  public var addWordView: () -> AddWordView
  public var settingsView: () -> SettingsView
  public var vocaView: () -> VocaView

  public init(
    addWordView: @escaping () -> AddWordView,
    settingsView: @escaping () -> SettingsView,
    vocaView: @escaping () -> VocaView
  ) {
    self.addWordView = addWordView
    self.settingsView = settingsView
    self.vocaView = vocaView
  }

  public static let defaultValue = ViewFactory(
    addWordView: { fatalError("Not Implemented") },
    settingsView: { fatalError("Not Implemented") },
    vocaView: { fatalError("Not Implemented") }
  )
}

public extension EnvironmentValues {
  var viewFactory: ViewFactory {
    get { self[ViewFactory.self] }
    set { self[ViewFactory.self] = newValue }
  }
}
