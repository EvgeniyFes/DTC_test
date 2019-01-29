//
//  NavigationBarHelper.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

class NavigationBarHelper {

    static func customizeNavBarFor(for vc: Presentable,
                                   actionHandler: NavigationViewHandler?) -> BaseNavigationView? {

        let navigationView = NavigationViewFactoryImp().makeNavigationView()
        if let view = navigationView.toPresent() {
            vc.toPresent()?.view.addSubview(view)

            var topOffsetValue = Constants.navigationViewTopOffsetValue
            if UIDevice().isXSeriesScreen {
                topOffsetValue = Constants.navigationViewTopOffsetiPhoneXValue
            }

            if let parentView = vc.toPresent()?.view {
                view.snp.makeConstraints { (make) -> Void in
                    make.height.equalTo(Constants.navigationViewHeight)
                    make.top.equalTo(parentView.snp.top).offset(topOffsetValue)
                    make.left.equalTo(parentView.snp.left)
                    make.right.equalTo(parentView.snp.right)
                }
            }
            navigationView.actionHandler = actionHandler
            return navigationView
        }
        return nil
    }
}
