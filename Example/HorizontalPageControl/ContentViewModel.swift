//
//  ContentViewData.swift
//  HorizontalPageControl_Example
//
//  Created by ChooHyoungLee on 2024/02/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation

struct ContentViewModel {
    var desc: String
    var imageName: String
}

extension ContentViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(desc)
        hasher.combine(imageName)
    }
}

extension ContentViewModel: Identifiable {
    var id: String {
        get {
            return "\(desc)\(imageName)"
        }
    }
}
