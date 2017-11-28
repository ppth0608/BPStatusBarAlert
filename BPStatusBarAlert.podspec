#
# Be sure to run `pod lib lint BPStatusBarAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BPStatusBarAlert'
  s.version          = '0.1.5'
  s.summary          = 'Very simple library that allows you to easily make StatusBar frame Alert(Notification)'
  s.description      = 'Very simple library that allows you to easily make StatusBar frame Alert(Notification) Make Fun!'
  s.homepage         = 'https://github.com/ppth0608/BPStatusBarAlert'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ben.park' => 'ppth0608@naver.com' }
  s.source           = { :git => 'https://github.com/ppth0608/BPStatusBarAlert.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.3'
  s.source_files = 'BPStatusBarAlert/Classes/**/*'
end
