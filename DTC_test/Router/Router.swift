//
//  Router.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol Router: Presentable {

    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: EmptyBlock?)

    func popModule()
    func popModule(animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: EmptyBlock?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)

    func popToRootModule(animated: Bool)
}
