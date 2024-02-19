# HorizontalPageControl

[![CI Status](https://img.shields.io/travis/4285647/HorizontalPageControl.svg?style=flat)](https://travis-ci.org/4285647/HorizontalPageControl)
[![Version](https://img.shields.io/cocoapods/v/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)
[![License](https://img.shields.io/cocoapods/l/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)
[![Platform](https://img.shields.io/cocoapods/p/HorizontalPageControl.svg?style=flat)](https://cocoapods.org/pods/HorizontalPageControl)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 17.0
Swift 5

## Installation

HorizontalPageControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HorizontalPageControl'
```

## Usage

```
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
