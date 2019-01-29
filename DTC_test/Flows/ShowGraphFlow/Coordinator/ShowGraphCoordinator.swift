//
//  ShowGraphCoordinator.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class ShowGraphCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let factory: ShowGraphModuleFactory
    private let router: Router
    private let provider: MoyaProvider<APIProvider>

    init(router: Router, factory: ShowGraphModuleFactory, provider: MoyaProvider<APIProvider>) {
        self.factory = factory
        self.router = router
        self.provider = provider
    }

    override func start() {
        showEnterPointsModule()
    }

    // MARK: - EnterPoints screen

    private func showEnterPointsModule() {
        var enterPointsVC = factory.makeEnterPointsCountModule()
        enterPointsVC.viewModel = EnterPointsCountViewModel(provider: provider)
        enterPointsVC.onGraphScreen = { [weak self] (model) in
            self?.showGraphModule(with: model)
        }

        _ = configureNavigationView(module: enterPointsVC, actionHandler: nil)
        router.setRootModule(enterPointsVC)
    }

    // MARK: - ShowGraph screen

    private func showGraphModule(with model: PointsFlowModelProtocol) {
        var showGraphVC = factory.makeShowGraphModule()
        showGraphVC.viewModel = ShowGraphViewModel(model: model)

        if let navigationView = configureNavigationView(module: showGraphVC, actionHandler: { (type) in
            switch type {
            case .save:
                showGraphVC.saveGraphToGallery()
            default:
                break
            }
        }) {
            navigationView.setupNavigationView(left: .back, right: .save)
        }
        router.push(showGraphVC)
    }

    // MARK: - Configuring Navigation View

    private func configureNavigationView(module: Presentable, actionHandler: NavigationViewHandler?) -> BaseNavigationView? {
        let navigationView = NavigationBarHelper.customizeNavBarFor(for: module, actionHandler: { [weak self] (type) in
            switch type {
            case .save: actionHandler?(type)
            default:    self?.handleNavigationButtonActionWith(type: type)
            }
        })
        return navigationView
    }

    // MARK: - Navigation Buttons Logic

    private func handleNavigationButtonActionWith(type: NavigationButtonType) {
        switch type {
        case .back:
            router.popModule()
        default:
            break
        }
    }
}
