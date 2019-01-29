//
//  PointModel.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol PointModelProtocol {
    var x: Double { get }
    var y: Double { get }
}

struct PointModel: PointModelProtocol, Decodable {
    var x: Double
    var y: Double
}
