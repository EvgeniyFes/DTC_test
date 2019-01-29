//
//  ModuleFactoryImp.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class ModuleFactoryImp: ModuleFactoryList {

    func makeEnterPointsCountModule() -> EnterPointsCountViewInput & EnterPointsCountViewOutput {
        return EnterPointsCountViewController.controllerFromStoryboard(.showGraph)
    }

    func makeShowGraphModule() -> ShowGraphViewInput & ShowGraphViewOutput {
        return ShowGraphViewController.controllerFromStoryboard(.showGraph)
    }
}
