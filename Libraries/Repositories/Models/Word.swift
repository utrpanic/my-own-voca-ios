import Foundation
import SwiftData

@Model
public final class Word {
  public let text: String
  public let histories: [History]

  public init(text: String, histories: [History]) {
    self.text = text
    self.histories = histories
  }
}

@Model
public final class History {
  public let from: String
  public let addedAt: Date

  public init(from: String, addedAt: Date) {
    self.from = from
    self.addedAt = addedAt
  }
}
