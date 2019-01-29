//
//  ViewPresentable.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol ViewPresentable {
    func toPresent() -> UIView?
}

extension UIView: ViewPresentable {

    func toPresent() -> UIView? {
        return self
    }
}
