//
//  CoordinatorFactoryImp.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class CoordinatorFactoryImp: CoordinatorFactory {

    func makeShowGraphCoordinator(router: Router) -> Coordinatable {
        return ShowGraphCoordinator(router: router, factory: ModuleFactoryImp(), provider: Dependencies.sharedDependencies.provider)
    }
}
