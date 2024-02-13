import SwiftUI

public struct DictionaryView: UIViewControllerRepresentable {
  public typealias UIViewControllerType = UIReferenceLibraryViewController
  
  private var term: String
  
  public init(term: String) {
    self.term = term
  }
  
  public func makeUIViewController(context: Context) -> UIViewControllerType {
    return UIReferenceLibraryViewController(term: self.term)
  }
  
  public func updateUIViewController(
    _ uiViewController: UIViewControllerType,
    context: Context
  ) {
    // Do nothing
  }
}
