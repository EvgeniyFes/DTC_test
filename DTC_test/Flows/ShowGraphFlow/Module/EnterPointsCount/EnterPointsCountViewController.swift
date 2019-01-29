//
//  EnterPointsCountViewController.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class EnterPointsCountViewController: BaseViewController, EnterPointsCountViewInput, EnterPointsCountViewOutput {

    // MARK: - EnterPointsCountViewInput

    var viewModel: EnterPointsCountViewModel!

    // MARK: - EnterPointsCountViewOutput
    
    var onGraphScreen: EnterPointsCountCompletionBlock?

    // MARK: - Outlets

    @IBOutlet private weak var enterCountLabel: UILabel! {
        didSet {
            enterCountLabel.text = "EnterPointsCountViewController.EnterCount.Title".localized
        }
    }
    @IBOutlet private weak var runButton: UIButton! {
        didSet {
            runButton.setTitle("EnterPointsCountViewController.RunButton.Title".localized, for: .normal)
            runButton.applyEnterPointsCountDesign()
        }
    }

    @IBOutlet private weak var countTextField: UITextField!

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    // MARK: - Private methods

    private func bind() {
        countTextField.rx.text.subscribe(onNext: { [weak self] (text) in
            self?.viewModel.updateCount(with: text)
        }).disposed(by: disposeBag)

        runButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.sendRequest()
        }).disposed(by: disposeBag)
    }

    private func sendRequest() {
        showWaitingScreen()

        viewModel.sendRequest { [weak self] (model, error) in
            self?.hideWaitingScreen()

            if let model = model {
                self?.onGraphScreen?(model)
            } else if let error = error {
                self?.showAlertError(message: error)
            }
        }
    }
}
