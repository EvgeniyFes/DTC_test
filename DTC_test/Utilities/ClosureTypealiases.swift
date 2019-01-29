//
//  ClosureTypealiases.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

typealias EmptyBlock = () -> Void

typealias EnterPointsCountBlock = (PointsFlowModelProtocol?, String?) -> Void

typealias EnterPointsCountCompletionBlock = (PointsFlowModelProtocol) -> Void

typealias NavigationViewHandler = (_ type: NavigationButtonType) -> Void

typealias SaveImageHandler = (UIImage?) -> Void
