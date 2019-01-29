//
//  NSObjectExtensions.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

extension NSObject {

    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }

    static var nibName: String {
        return String(describing: self)
    }

}
