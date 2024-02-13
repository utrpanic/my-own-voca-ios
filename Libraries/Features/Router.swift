import SwiftUI

public struct Router: EnvironmentKey {
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

  public static let defaultValue = Router(
    addWordView: { fatalError("Not Implemented") },
    settingsView: { fatalError("Not Implemented") },
    vocaView: { fatalError("Not Implemented") }
  )
}

public extension EnvironmentValues {
  var router: Router {
    get { self[Router.self] }
    set { self[Router.self] = newValue }
  }
}
