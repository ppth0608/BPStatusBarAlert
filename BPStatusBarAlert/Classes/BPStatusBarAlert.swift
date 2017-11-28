//
//  BPStatusBarAlert.swift
//  Pods
//
//  Created by Ben.Park on 2017. 1. 24..
//
//


import UIKit

public enum AlertPosition {
    case statusBar
    case navigationBar
}

public class BPStatusBarAlert: UIView {
    
    typealias Position = AlertPosition
    typealias Completion = () -> Void
        
    fileprivate var containerWindow: UIWindow?
    
    fileprivate var deviceStatusBarHeight:CGFloat {
        
        let deviceDimensions = DeviceDimensions()
        return deviceDimensions.statusBarHeight
    }
    fileprivate var duration: TimeInterval
    fileprivate var delay: TimeInterval
    fileprivate var isShowing: Bool = false
    fileprivate var position: Position
    fileprivate var completion: Completion?
    
    fileprivate var messageLable: UILabel = UILabel()
    fileprivate var messageColor: UIColor = UIColor.white
    
    fileprivate var statusBarHeight:CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + deviceStatusBarHeight
    }
    fileprivate let navigationBarHeight: CGFloat = 44.0
    fileprivate let screenWidth = UIScreen.main.bounds.width
    fileprivate let screenHeight = UIScreen.main.bounds.height
    
    public init(duration: TimeInterval = 0.3, delay: TimeInterval = 2, position: AlertPosition = .statusBar) {
        
        self.duration = duration
        self.delay = delay
        self.position = position
        self.completion = nil
        
        super.init(frame: CGRect.zero)
                
        setupView(position: self.position)
        setupMessageLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: setup function
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
    
    fileprivate func setupView(position: Position) {
        self.backgroundColor = UIColor.bgColor
        self.position = position
        frame = frame(position: position)
    }
    
    fileprivate func setupMessageLabel() {
        messageLable.frame = CGRect(x: 10, y: deviceStatusBarHeight, width: frame.size.width - 10, height: statusBarHeight)
        messageLable.textColor = messageColor
        messageLable.textAlignment = .center
        messageLable.numberOfLines = 0
        messageLable.font = UIFont.systemFont(ofSize: 13)
        messageLable.backgroundColor = UIColor.clear
        messageLable.text = ""
        addSubview(messageLable)
    }
}

// MARK: chaning function and show / hide functions
extension BPStatusBarAlert {
    
    public func message(message: String) -> Self {
        self.messageLable.text = message
        return self
    }
    
    public func messageColor(color: UIColor) -> Self {
        self.messageLable.textColor = color
        return self
    }
    
    public func bgColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    public func completion(_ completion: @escaping () -> Void) -> Self {
        self.completion = completion
        return self
    }
    
    public func show() {
        adjustViewHierarchy(position: position)
        
        startAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                self.finishAnimating()
            }
        }
    }
}

// MARK: animation functions
extension BPStatusBarAlert {
    
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
            self.completion?()
        }
    }
}

// MARK: manage window hierarchy functions
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
}

// MARK: Extensions
fileprivate extension UIColor {
    
    static var bgColor: UIColor {
        return UIColor(red: 77/255, green: 188/255, blue: 201/255, alpha: 1)
    }
}
