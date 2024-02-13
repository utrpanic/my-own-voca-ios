import Models
import SwiftUI

public struct Router: EnvironmentKey {
  public var addWordView: () -> AddWordView
  public var settingsView: () -> SettingsView
  public var vocaView: () -> VocaView
  public var wordDetailView: (Word) -> WordDetailView

  public init(
    addWordView: @escaping () -> AddWordView,
    settingsView: @escaping () -> SettingsView,
    vocaView: @escaping () -> VocaView,
    wordDetailView: @escaping (Word) -> WordDetailView
  ) {
    self.addWordView = addWordView
    self.settingsView = settingsView
    self.vocaView = vocaView
    self.wordDetailView = wordDetailView
  }

  public static let defaultValue = Router(
    addWordView: { fatalError("Not Implemented") },
    settingsView: { fatalError("Not Implemented") },
    vocaView: { fatalError("Not Implemented") },
    wordDetailView: { _ in fatalError("Not Implemented") }
  )
}

public extension EnvironmentValues {
  var router: Router {
    get { self[Router.self] }
    set { self[Router.self] = newValue }
  }
}
