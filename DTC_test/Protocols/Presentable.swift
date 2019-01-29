//
//  Presentable.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }
}
