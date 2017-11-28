//
//  DeviceDimensions.swift
//  
//
//  Created by Sameh Salama on 11/28/17.
//

import UIKit

internal struct DeviceDimensions {
    
    fileprivate let iPhoneXDeviceHeight:CGFloat = 2436
    fileprivate let paddingHeight:CGFloat = 15
    
    fileprivate var device:UIDevice {
        return UIDevice.current
    }
    fileprivate var screen:UIScreen {
        return UIScreen.main
    }
    
    var statusBarHeight: CGFloat {
        let  hasNotch = device.userInterfaceIdiom == .phone && screen.nativeBounds.height == iPhoneXDeviceHeight
        return hasNotch ? paddingHeight : 0
    }
    
}
