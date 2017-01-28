# BPStatusBarAlert

[![CI Status](http://img.shields.io/travis/taehyun.park/BPStatusBarAlert.svg?style=flat)](https://travis-ci.org/taehyun.park/BPStatusBarAlert)
[![Version](https://img.shields.io/cocoapods/v/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)
[![License](https://img.shields.io/cocoapods/l/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)
[![Platform](https://img.shields.io/cocoapods/p/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)

`BPStatusBarAlert` is a library that allows you to easily make text-based alert that appear on the status bar.

## Requirements
 - Deployment Target - `iOS 8.3`
 - Swift Version - `Swift 3`

## Installation

### CocoaPods
BPStatusBarAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BPStatusBarAlert"
```

### Manual
Copy the folder `BPStatusBarAlert` to your project

## Usage
First, you need the following import BPStatusBarAlert
```Swift
import BPStatusBarAlert
```

Now, you can uses `BPStatusBarAlert` classes using shared property
```Swift
@IBAction func buttonTapped(_ sender: Any) {
    BPStatusBarAlert.shared.show(message: "Complete sharing this article!")
}
```

Show function is composed below code
```Swift
public func show(message: String, messageColor: UIColor = UIColor.white, bgColor: UIColor = UIColor.bgColor) {
    ...
}
```

So, if you want set up Message text, Message Color, Background Color, you call `show` function with arguments
```Swift
BPStatusBarAlert.shared.show(message: "Complete sharing this article!", messageColor: UIColor.red, bgColor: UIColor.blue)
```

## TODO
- [ ] Below NavigationBar Alert
- [ ] Support landscape Mode
- [ ] Custom Show and Hide (like facebook)
- [ ] Deal with Long text 

## Author

Ben.Park, ppth0608@naver.com

## License

BPStatusBarAlert is available under the MIT license. See the LICENSE file for more info.
