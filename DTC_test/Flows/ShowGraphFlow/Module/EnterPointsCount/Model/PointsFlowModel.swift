//
//  PointsFlowModel.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol PointsFlowModelProtocol {
    var points: [PointModelProtocol] { get }

    mutating func updatePoints(_ points: [PointModelProtocol])
}

struct PointsFlowModel: PointsFlowModelProtocol {

    var points: [PointModelProtocol] = []

    mutating func updatePoints(_ points: [PointModelProtocol]) {
        self.points = points
    }
}
