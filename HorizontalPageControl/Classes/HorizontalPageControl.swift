//
//  HorizontalPageControl.swift
//  HorizontalPageControl
//
//  Created by ChooHyoungLee on 2024/02/19.
//

import SwiftUI

/// Structure for HorizontalPageControl configuration.
public struct HorizontalPageControlConfig {
    /// Uses typealias to define a identifiable scroll position.
    public typealias PositionID = String
    
    /// Width of a single page.
    fileprivate var pageWidth: CGFloat
    
    /// Total number of pages.
    fileprivate var numberOfPages: Int
    
    /// Binding to the current page index.
    @Binding var currentPage: Int
    
    /// Binding to the identifiable current page position.
    @Binding var pagePositionId: PositionID?
    
    /// Designated initializer.
    public init(_ contentWidth: CGFloat,
                _ contentsCount: Int,
                _ page: Binding<Int>,
                _ positionId: Binding<PositionID?>) {
        self.pageWidth = contentWidth
        self.numberOfPages = contentsCount
        _currentPage = page
        _pagePositionId = positionId
    }
}

/// HorizontalPageControl structure.
public struct HorizontalPageControl<Content: View, Indicator: PageIndicator>: View {
    /// Uses typealias to define a closure type named PageChangeCallBack.
    /// This closure takes two identifiable page position parameters.
    ///
    /// While user swiping, scroll position changed and HorizontalPageConrol invoke this callback with two parameters.
    ///
    /// First one is previous identifiable page position.
    ///
    /// Second one is new identifiable page position.
    public typealias PageChangeCallBack = (HorizontalPageControlConfig.PositionID, HorizontalPageControlConfig.PositionID) -> Void
    
    /// Uses typealias to define a closure type named PageIndicatorTouchCallBack.
    /// This closure takes two identifiable page position parameters.
    ///
    /// When user tapped page indicator, HorizontalPageControl invoke this callback with two parameters.
    ///
    /// So, you can scroll to specific page via ScrollViewProxy programmatically.
    ///
    /// First parameter is ScrollViewProxy which supports programmatic scrolling.
    ///
    /// Second parameter is index of page indicator so you can query exact page with this.
    public typealias PageIndicatorTouchCallBack = (ScrollViewProxy, Int) -> Void
    
    /// Configuration
    private var config: HorizontalPageControlConfig
    
    /// The content to be displayed in the scroll view
    @ViewBuilder var scrollContent: Content
    
    /// Optional callback which is invoked when scroll position changed.
    private var onPageChange: PageChangeCallBack?
    
    /// Optional callback which is invoked when user tap page indicator.
    private var onIndicatorTouch: PageIndicatorTouchCallBack?
    
    /// Function to create the page indicator view.
    var indicatorBuilder: (Int, Binding<Int>) -> Indicator
    
    /// Designated Initializer.
    public init(_ config: HorizontalPageControlConfig,
         @ViewBuilder _ builder: () -> Content,
         indicatorBuilder: @escaping (Int, Binding<Int>) -> Indicator) {
        self.config = config
        self.scrollContent = builder()
        self.indicatorBuilder = indicatorBuilder
    }
    
    public var body: some View {
        ScrollViewReader { scrollProxy in
            ZStack(alignment: Alignment(horizontal: .center,
                                        vertical: .center)) {
                ScrollView(.horizontal) {
                    HStack(spacing: .zero) {
                        scrollContent
                    }
                    .scrollTargetLayout()
                }
                .defaultScrollAnchor(.leading)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .frame(maxWidth: config.pageWidth * CGFloat(config.numberOfPages))
                .frame(maxHeight: .infinity)
            }
                        
            self.indicatorBuilder(self.config.numberOfPages, self.config.$currentPage)
                .onTouched({ index in
                    self.onIndicatorTouch?(scrollProxy, index)
                })
        }
        .scrollPosition(id: config.$pagePositionId)
        .onChange(of: config.pagePositionId ?? "") { (oldValue: HorizontalPageControlConfig.PositionID,
                                                        newValue: HorizontalPageControlConfig.PositionID) in
            self.onPageChange?(oldValue, newValue)
        }
        
    }
    
    /// Function to register a closure that will be called when the user swipe HorizontalPageControl.
    /// Returns Self to support method chaining.
    public func onPageChanged(_ closure: @escaping PageChangeCallBack) -> Self {
        var new = self
        new.onPageChange = closure
        return new
    }
    
    /// Function to register a closure that will be called when the user tap page indicator.
    /// Returns Self to support method chaining.
    public func onIndicatorTouched(_ closure: @escaping PageIndicatorTouchCallBack) -> Self {
        var new = self
        new.onIndicatorTouch = closure
        return new
    }
}

////////////////////////////////////////////////
/////////////// only for Preview ///////////////
////////////////////////////////////////////////
private struct DummyViewContents {
    struct SubDummyViewContents: Identifiable {
        var id = UUID()
    }
    
    var subContents: [SubDummyViewContents] = [
        SubDummyViewContents(),
        SubDummyViewContents(),
        SubDummyViewContents(),
        SubDummyViewContents()
    ]
}

//////////////////////////////////////////////////
/// wrapper for preview with @State properties ///
//////////////////////////////////////////////////
struct HorizontalScrollViewWrapper<Page, PositionId, Content: View>: View {
    @State var page: Page
    @State var positionId: PositionId
    var content: (Binding<Page>, Binding<PositionId>, @escaping (Int, Binding<Int>) -> CirclePageIndicator) -> Content
    var indicator: (Int, Binding<Int>) -> CirclePageIndicator
    
    init(_ page: Page,
         _ positionId: PositionId,
         content: @escaping (Binding<Page>, Binding<PositionId>, @escaping (Int, Binding<Int>) -> CirclePageIndicator) -> Content,
         indicator: @escaping (Int, Binding<Int>) -> CirclePageIndicator) {
        self._page = State(wrappedValue: page)
        self._positionId = State(wrappedValue: positionId)
        self.content = content
        self.indicator = indicator
    }
    
    var body: some View {
        content($page, $positionId, self.indicator)
    }
}

#Preview {
    HorizontalScrollViewWrapper(0, "Foo") { (page, positionId, indicator) in
        HorizontalPageControl(HorizontalPageControlConfig(UIScreen.main.bounds.width,
                                                          DummyViewContents().subContents.count,
                                                          page, positionId))
        {
            ForEach(DummyViewContents().subContents) { _ in
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
                    .overlay(Color(UIColor(red: CGFloat.random(in: 0 ... 1),
                                           green: CGFloat.random(in: 0 ... 1),
                                           blue: CGFloat.random(in: 0 ... 1),
                                           alpha: 1.0)))
            }
        } indicatorBuilder: { (totalPage, page) in
            indicator(totalPage, page)
        }
        .onPageChanged { oldValue, newValue in
            print("oldValue:\(oldValue), newValue:\(newValue)")
        }
        
    } indicator: { (numberOfPages, currentPage) in
        CirclePageIndicator(numberOfPages: numberOfPages, currentPage: currentPage)
    }
}
