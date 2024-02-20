import SwiftUI

/// Defines the PageIndicator protocol. 
/// This protocol must conform to View, and specifies the basic requirements for a page indicator UI component.
public protocol PageIndicator: View {
    /// Uses typealias to define a closure type named OnTouchCallback.
    /// This closure takes an Int parameter (index of page indicator) and has no return value.
    typealias OnTouchCallback = (Int) -> Void
    
    /// A property representing the total number of pages. It must be gettable.
    var numberOfPages: Int { get }
    
    /// A property representing the index of the currently active page. It must be gettable.
    var currentPage: Int { get }
    
    /// The onTouched function is a method to register a closure that will be called when the user touches the page indicator.
    /// Returns Self to support method chaining.
    func onTouched(_ closure: @escaping OnTouchCallback) -> Self
 
    /// Designated initializer.
    init(numberOfPages: Int, currentPage: Binding<Int>)
}
