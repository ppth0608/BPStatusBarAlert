#
# Be sure to run `pod lib lint BPStatusBarAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BPStatusBarAlert'
  s.version          = '0.1.1'
  s.summary          = 'Very simple library that allows you to easily make StatusBar frame Alert(Notification)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Very simple library that allows you to easily make StatusBar frame Alert(Notification) Make Fun!'
  s.homepage         = 'https://github.com/ppth0608/BPStatusBarAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ben.park' => 'ppth0608@naver.com' }
  s.source           = { :git => 'https://github.com/ppth0608/BPStatusBarAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.3'

  s.source_files = 'BPStatusBarAlert/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BPStatusBarAlert' => ['BPStatusBarAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
