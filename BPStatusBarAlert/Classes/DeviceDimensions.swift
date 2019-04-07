//
//  DeviceDimensions.swift
//
//
//  Created by Sameh Salama on 11/28/17.
//

import UIKit

internal struct DeviceDimensions {
    
    fileprivate let iPhoneXMaxDeviceHeight: CGFloat = 2688
    fileprivate let iPhoneXDeviceHeight:CGFloat = 2436
    fileprivate let iPhoneXRDeviceHeight: CGFloat = 1792
    fileprivate let paddingHeight:CGFloat = 15
    fileprivate let nonPaddingHeight:CGFloat = 20
    
    fileprivate var device:UIDevice {
        return UIDevice.current
    }
    fileprivate var screen:UIScreen {
        return UIScreen.main
    }
    
    var hasNotch : Bool
    {
        guard device.userInterfaceIdiom == .phone else {
            return false
        }
        
        if #available(iOS 11.0, *),
            let safeHeight = UIApplication.shared.keyWindow?.safeAreaInsets.top  {
            if safeHeight == 44
            {
                return true
            }
        }
        
        if [iPhoneXDeviceHeight, iPhoneXMaxDeviceHeight, iPhoneXRDeviceHeight].contains(screen.nativeBounds.height)
        {
            return true
        }
        
        return false
    }
    
    var statusBarHeight: CGFloat {
        if hasNotch
        {
            return paddingHeight
        }else {
            return nonPaddingHeight
        }
    }
    
}
