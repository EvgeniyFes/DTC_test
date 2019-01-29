//
//  CoordinatorFactory.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol CoordinatorFactory {
    func makeShowGraphCoordinator(router: Router) -> Coordinatable
}
