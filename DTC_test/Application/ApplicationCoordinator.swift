//
//  ApplicationCoordinator.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class ApplicationCoordinator: BaseCoordinator {

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        runInstructor()
    }

    private func runInstructor() {
        runShowGraphFlow()
    }

    private func runShowGraphFlow() {
        let coordinator = coordinatorFactory.makeShowGraphCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
