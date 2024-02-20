//
//  ContentView.swift
//  HorizontalPageControl_Example
//
//  Created by ChooHyoungLee on 2024/02/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var model: ContentViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            Image(model.imageName, bundle: Bundle.main)
            Text(model.desc).font(.body).foregroundStyle(Color.blue)
        }
    }
}

#Preview {
    ContentView(model: ContentViewModel(desc: "Big Bug Bunny Thumbnail", imageName: "bigbugbunny0"))
}
