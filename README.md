# BPStatusBarAlert

[![Version](https://img.shields.io/cocoapods/v/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)
[![License](https://img.shields.io/cocoapods/l/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)
[![Platform](https://img.shields.io/cocoapods/p/BPStatusBarAlert.svg?style=flat)](http://cocoapods.org/pods/BPStatusBarAlert)

`BPStatusBarAlert` is a library that allows you to easily make text-based alert that appear on the status bar and below navigation bar. </br>

## Demo
### StatusBar Position
<img src="https://cloud.githubusercontent.com/assets/9531750/22561102/400b9132-e9ba-11e6-8c25-8122fd108df5.gif" width="320" height="590" />

### NavigationBar Position
<img src="https://cloud.githubusercontent.com/assets/9531750/22561105/4238acce-e9ba-11e6-8cc3-6dc9fd597a78.gif" width="320" height="590" />

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
First, you need the following import `BPStatusBarAlert`
```Swift
import BPStatusBarAlert
```

Now, you can uses `BPStatusBarAlert` simply like this
```Swift
@IBAction func buttonTapped(_ sender: Any) {
    BPStatusBarAlert()
        .message(message: "Complete Sharing This Contents")
        .show()
}
```

Initialize `BPStatusBarAlert` with no parameters, it will set up default value for property
Default setting
 - Animation Duration : 0.3
 - Animation Delay : 2.0
 - Postion : .statusBar
 - Background Color : UIColor(red: 77/255, green: 188/255, blue: 201/255, alpha: 1)
 - Message Text : ""
 - Message Text Color : .white
 - Completion : nil
 
So, If you want customize property, just **call init method with parameters and chaning function**

 - init (customize Duration, Delay and Postion)
`BPStatusBarAlert` class init method is composed below code
```Swift
public init(duration: TimeInterval = 0.3, delay: TimeInterval = 2, position: AlertPosition = .statusBar)
```
So, if you change time interval in animations and position of `BPStatusBarAlert`, using defaults paramaters

 - chaning function (customize Background Color, Message Text, Message Text Color, Completion)

```Swift
BPStatusBarAlert(duration: 0.3, delay: 2, position: .statusBar) // customize duration, delay and position
    .message(message: "Complete Sharing This Contents")         // customize message
    .messageColor(color: .white)                                // customize message color
    .bgColor(color: .blue)                                      // customize view's background color
    .completion { print("completion closure will called") }     // customize completion(Did hide alert view)
    .show()                                                     // Animation start
```

## TODO
- [x] Change window level on NavigationBar position
- [ ] Support landscape Mode
- [ ] Custom Show and Hide (like facebook)
- [ ] Support Custom Navigation Bar

## Author

Ben.Park, ppth0608@naver.com

## Contribute

always welcome :)
Only pull request.

## License

BPStatusBarAlert is available under the MIT license. See the LICENSE file for more info.
