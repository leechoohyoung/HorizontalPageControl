//
//  CirclePageIndicator.swift
//  HorizontalPageControl
//
//  Created by ChooHyoungLee on 2024/02/19.
//

import SwiftUI

/// structure conforming to the PageIndicator protocol that represents a circle page indicator.
public struct CirclePageIndicator: PageIndicator {
    /// The total number of pages.
    public var numberOfPages: Int
    
    /// A binding to the current page index, allowing for two-way data flow.
    @Binding public var currentPage: Int
    
    /// An optional callback closure that is triggered when a circle is tapped.
    var onTouched: OnTouchCallback?
    
    /// Initializes the circle page indicator with the total number of pages and a binding to the current page.
    public init(numberOfPages: Int, currentPage: Binding<Int>) {
        self.numberOfPages = numberOfPages
        _currentPage = currentPage
    }
    
    public var body: some View {
        HStack {
            ForEach(0 ..< numberOfPages, id:\.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(index == self.currentPage ? .accentColor : .gray)
                    .onTapGesture(perform: {
                        self.currentPage = index
                        self.onTouched?(index)
                    })
            }
        }
    }
    
    /// The onTouched function is a method to register a closure that will be called when the user touches the page indicator.
    /// Returns Self to support method chaining.
    public func onTouched(_ closure: @escaping OnTouchCallback) -> Self {
        var new = self
        new.onTouched = closure
        return new
    }
}

//////////////////////////////////////////////////
/// wrapper for preview with @State properties ///
//////////////////////////////////////////////////
struct CirclePageIndicatorWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

#Preview {
    CirclePageIndicatorWrapper(1) { value in
        CirclePageIndicator(numberOfPages: 3, currentPage: value)
    }
}
