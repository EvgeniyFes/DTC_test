//
//  DeviceExtensions.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

extension UIDevice {
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }

    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPhoneXR
        case iPhoneXSMax
        case unknown
    }

    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 1792:
            return .iPhoneXR
        case 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        case 2688:
            return .iPhoneXSMax
        default:
            return .unknown
        }
    }
    
    var isXSeriesScreen: Bool {
        return UIDevice().screenType == .iPhoneX ||
            UIDevice().screenType == .iPhoneXR ||
            UIDevice().screenType == .iPhoneXSMax
    }
}
