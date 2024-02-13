import Models
import SwiftUI

public struct WordDetailView: View {
  
  private let word: Word
  
  public init(_ word: Word) {
    self.word = word
  }
  
  public var body: some View {
    DictionaryView(term: self.word.text)
  }
  
  
}
