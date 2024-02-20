#
# Be sure to run `pod lib lint HorizontalPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HorizontalPageControl'
  s.version          = '0.2.1'
  s.summary          = 'Simple Horizontal Page Control written SwiftUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple Horizontal Page Control written SwiftUI.
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
                       DESC

  s.homepage         = 'https://github.com/leechoohyoung/SimpleHorizontalPageControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'leechoohyoung@gmail.com'
  s.source           = { :git => 'https://github.com/leechoohyoung/HorizontalPageControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'
  s.ios.deployment_target = '17.0'

  s.source_files = 'HorizontalPageControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HorizontalPageControl' => ['HorizontalPageControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
