//
//  BaseCoordinator.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

class BaseCoordinator: Coordinatable {

    var childCoordinators: [Coordinatable] = []

    // MARK: - Coordinatable

    var finishFlow: EmptyBlock?
    func start() {}

    // Utility `DisposeBag` used by the subclasses.
    let disposeBag = DisposeBag()

    // add only unique object
    func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinatable?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
