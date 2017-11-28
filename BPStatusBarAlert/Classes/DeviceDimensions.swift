//
//  DeviceDimensions.swift
//  
//
//  Created by Sameh Salama on 11/28/17.
//

import UIKit

public class DeviceDimensions {
    
    fileprivate var iPhoneXDeviceHeight:CGFloat = 2436
    fileprivate var paddingHeight:CGFloat = 15
    
    fileprivate var device:UIDevice {
        return UIDevice.current
    }
    fileprivate var screen:UIScreen {
        return UIScreen.main
    }
    
    var statusBarHeight:CGFloat {
        get {
            let hasNotch = self.device.userInterfaceIdiom == .phone && self.screen.nativeBounds.height == self.iPhoneXDeviceHeight
            return hasNotch ? self.paddingHeight : 0
        }
    }
    
}
