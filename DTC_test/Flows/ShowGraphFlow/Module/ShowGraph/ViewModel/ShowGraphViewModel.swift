//
//  ShowGraphViewModel.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Charts

struct ShowGraphViewModel {
    private var model: PointsFlowModelProtocol

    init(model: PointsFlowModelProtocol) {
        self.model = model
    }

    func lineChartViewData() -> LineChartData {
        let sortedPoints = model.points.sorted(by: { $0.x < $1.x })
        var lineChartEntry: [ChartDataEntry] = []

        for point in sortedPoints {
            lineChartEntry.append(ChartDataEntry(x: point.x, y: point.y))
        }
        let line = LineChartDataSet(values: lineChartEntry, label: "")
        line.colors = [.black]
        line.mode = .cubicBezier

        let data = LineChartData()
        data.addDataSet(line)
        return data
    }
}
