# HorizontalPageControl

[![CI Status](https://img.shields.io/travis/4285647/HorizontalPageControl.svg?style=flat)](https://travis-ci.org/4285647/HorizontalPageControl)
[![Version](https://img.shields.io/cocoapods/v/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)
[![License](https://img.shields.io/cocoapods/l/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)
[![Platform](https://img.shields.io/cocoapods/p/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)

## Demo
![DemoGIF](https://private-user-images.githubusercontent.com/4285647/306146808-3c6ef523-c2e4-481d-9e57-959503bcdea4.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDg0MDc5NjEsIm5iZiI6MTcwODQwNzY2MSwicGF0aCI6Ii80Mjg1NjQ3LzMwNjE0NjgwOC0zYzZlZjUyMy1jMmU0LTQ4MWQtOWU1Ny05NTk1MDNiY2RlYTQuZ2lmP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI0MDIyMCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNDAyMjBUMDU0MTAxWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9MWQwNTI3MjIzZjkxYmIzMzY4NGNkMDRhNTFiZWM0ZDRhMWU2OGY1MGE5MWM0OWMzZGVkN2VmOGE3MjlhZTdmOCZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QmYWN0b3JfaWQ9MCZrZXlfaWQ9MCZyZXBvX2lkPTAifQ.seH3qV09AXFV_03hSBYSpfrfLEHi4__l1cedXSpWUk8)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 17.0, Swift 5

## Installation

HorizontalPageControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HorizontalPageControl'
```

## Usage

```swift
var body: some View {
    let config = ...
    HorizontalPageControl(config: ...) {
        // implement your views here
    }
    .onPageChanged { oldValue, newValue in
        print("oldValue:\(oldValue), newValue:\(newValue)")
    }
    .onIndicatorTouched { scrollViewProxy, index in
        print("you can scroll to specific page programmatically via scrollViewProxy:\(scrollViewProxy), index:\(index)")
    }
}
```

## Author

leechoohyoung@gmail.com

## License

HorizontalPageControl is available under the MIT license. See the LICENSE file for more info.
