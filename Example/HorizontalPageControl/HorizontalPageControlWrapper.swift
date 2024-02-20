//
//  HorizontalPageControlWrapper.swift
//  HorizontalPageControl_Example
//
//  Created by ChooHyoungLee on 2024/02/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import HorizontalPageControl

/// Structure for wrapping HorizontalPageControl to use SwiftUI views in UIKit.
struct HorizontalPageControlWrapper: View {
    @State var models: [ContentViewModel] = [0,1,2].map { index in
        ContentViewModel(desc: "Big Bug Bunny Thumbnail. (\(index)/3)", imageName: "bigbugbunny\(index)")
    }
    @State var currentPage: Int = 0
    @State var scrollPositionID: ContentViewModel.ID?
    
    var body: some View {
        GeometryReader { geometry in
            let config = HorizontalPageControlConfig(geometry.size.width,
                                                     models.count,
                                                     $currentPage,
                                                     $scrollPositionID)
            HorizontalPageControl(config) {
                ForEach(models) { model in
                    ContentView(model: model).frame(width: geometry.size.width)
                }
            } indicatorBuilder: { numberOfPages, currentPage in
                CirclePageIndicator(numberOfPages: numberOfPages, currentPage: currentPage)
            }
            .onPageChanged { oldPositionId, newPositionID in
                guard let newPage = models.lastIndex(where: { model in
                    model.id == newPositionID
                }) else { return }
                
                currentPage = newPage
            }
            .onIndicatorTouched { scrollViewProxy, index in
                withAnimation {
                    scrollViewProxy.scrollTo(models[index].id)
                }
            }
        }
    }
    
    static func createHostingController() -> UIHostingController<HorizontalPageControlWrapper> {
        return UIHostingController(rootView: HorizontalPageControlWrapper())
    }
}

#Preview {
    HorizontalPageControlWrapper()
}
