//
//  NavigationViewFactoryImp.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class NavigationViewFactoryImp: NavigationViewFactory {

    let commonFrame: CGRect = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: Constants.navigationViewHeight)

    func makeNavigationView() -> BaseNavigationView {
        let navigationView = NavigationView(frame: commonFrame)
        return navigationView
    }

}
