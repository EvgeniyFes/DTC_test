//
//  ShowGraphViewController.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Charts

class ShowGraphViewController: BaseViewController, ShowGraphViewInput, ShowGraphViewOutput {

    // MARK: - ShowGraphViewInput

    var viewModel: ShowGraphViewModel!

    // MARK: - Outlets

    @IBOutlet private weak var chartView: LineChartView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        chartView.data = viewModel.lineChartViewData()
    }
}

// MARK: - ShowGraphViewInput

extension ShowGraphViewController {

    func saveGraphToGallery() {
        showWaitingScreen()
        chartView.takeScreenshot(completion: { [weak self] (image) in
            self?.hideWaitingScreen()

            if image != nil {
                self?.showAlertError(title: "Success.Title".localized, message: "ShowGraphViewController.ImageSaved.Message".localized)
            }
        })
    }
}
