//
//  BPStatusBarAlert.swift
//  Pods
//
//  Created by Ben.Park on 2017. 1. 24..
//
//

import Foundation

public enum AlertPosition {
    case statusBar
    case navigationBar
}

public class BPStatusBarAlert: UIButton {
    
    typealias Position = AlertPosition
    
    public static let shared = BPStatusBarAlert()
    
    fileprivate var containerWindow: UIWindow?
    
    fileprivate var duration = 0.3
    fileprivate var delay = 2.0
    fileprivate var isShowing: Bool = false
    fileprivate var position: Position = .statusBar {
        didSet {
            if position != oldValue {
                frame = frame(position: position)
            }
        }
    }
    
    fileprivate var messageLable: UILabel = UILabel()
    fileprivate var messageColor: UIColor = UIColor.white
    
    fileprivate let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    fileprivate let navigationBarHeight: CGFloat = 44.0
    fileprivate let screenWidth = UIScreen.main.bounds.width
    fileprivate let screenHeight = UIScreen.main.bounds.height
    
    public init() {
        super.init(frame: CGRect.zero)
        setupViewFrame(position: self.position)
        setupMessageLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BPStatusBarAlert {
    
    fileprivate func frame(position: Position) -> CGRect {
        var frame = CGRect()
        switch position {
        case .statusBar:
            frame = CGRect(x: 0, y: -statusBarHeight, width: screenWidth, height: statusBarHeight)
        case .navigationBar:
            frame = CGRect(x: 0, y: navigationBarHeight, width: screenWidth, height: statusBarHeight)
        }
        return frame
    }
    
    fileprivate func setupViewFrame(position: Position) {
        self.position = position
        frame = frame(position: position)
    }
    
    fileprivate func setupMessageLabel() {
        messageLable.frame = CGRect(x: 10, y: 0, width: frame.size.width - 10, height: statusBarHeight)
        messageLable.textColor = messageColor
        messageLable.textAlignment = .center
        messageLable.numberOfLines = 0
        messageLable.font = UIFont.systemFont(ofSize: 13)
        messageLable.backgroundColor = UIColor.clear
        addSubview(messageLable)
    }
}

extension BPStatusBarAlert {
    
    public func show(position: AlertPosition = .statusBar,
                     message: String,
                     messageColor: UIColor = UIColor.white,
                     bgColor: UIColor = UIColor.bgColor) {
        self.position = position
        decorateAttribute(message: message, messageColor: messageColor, bgColor: bgColor)
        adjustViewHierarchy(position: position)
        
        startAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                self.finishAnimating()
            }
        }
    }
    
    fileprivate func startAnimation(completion: @escaping () -> Void) {
        guard !isShowing else {
            return
        }
        isShowing = true
        
        UIView.animate(withDuration: duration, animations: {
            switch self.position {
            case .statusBar:
                self.frame.origin.y = 0
            case .navigationBar:
                self.frame.origin.y = self.navigationBarHeight + self.statusBarHeight
            }
            self.layoutIfNeeded()
        }) { _ in
            completion()
        }
    }
    
    fileprivate func finishAnimating() {
        UIView.animate(withDuration: duration, animations: {
            switch self.position {
            case .statusBar:
                self.frame.origin.y = -self.statusBarHeight
            case .navigationBar:
                self.frame.origin.y = self.navigationBarHeight
            }
            self.layoutIfNeeded()
        }) { _ in
            self.isShowing = false
            self.containerWindow?.isHidden = true
        }
    }
}

extension BPStatusBarAlert {
    
    fileprivate func adjustViewHierarchy(position: Position) {
        switch position {
        case .statusBar:
            addAlertViewInContainerWindow()
        case .navigationBar:
            addAlertViewInCurrentWindow()
        }
    }
    
    fileprivate func addAlertViewInContainerWindow() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        containerWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: statusBarHeight))
        containerWindow?.backgroundColor = UIColor.clear
        containerWindow?.windowLevel = UIWindowLevelStatusBar
        containerWindow?.rootViewController = UIViewController()
        containerWindow?.rootViewController?.view.addSubview(self)
        containerWindow?.isHidden = false
    }
    
    fileprivate func addAlertViewInCurrentWindow() {
        guard let keyWindow = UIApplication.shared.keyWindow,
              let rootViewController = keyWindow.rootViewController as? UINavigationController else {
            return
        }
        let navigationBar = rootViewController.navigationBar
        rootViewController.view.insertSubview(self, belowSubview: navigationBar)
    }
    
    fileprivate func decorateAttribute(message: String, messageColor: UIColor, bgColor: UIColor) {
        messageLable.text = message
        messageLable.textColor = messageColor
        backgroundColor = bgColor
    }
}

fileprivate extension UIColor {
    
    static var bgColor: UIColor {
        return UIColor(red: 77/255, green: 188/255, blue: 201/255, alpha: 1)
    }
}
