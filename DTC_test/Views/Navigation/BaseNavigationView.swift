//
//  BaseNavigationView.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

class BaseNavigationView: BaseView {

    var actionHandler: NavigationViewHandler?

    private var leftButtonType: NavigationButtonType = .none {
        didSet {
            leftButton.updateType(leftButtonType)
        }
    }
    private var rightButtonType: NavigationButtonType = .none {
        didSet {
            rightButton.updateType(rightButtonType)
        }
    }

    // MARK: - IBOutles

    @IBOutlet private weak var leftButton: NavigationButton!
    @IBOutlet private weak var rightButton: NavigationButton!

    // MARK: - Public Methods

    func setupNavigationView(left: NavigationButtonType, right: NavigationButtonType) {
        leftButtonType = left
        rightButtonType = right
    }

    // MARK: - Actions

    @IBAction private func buttonPressed(_ sender: NavigationButton) {
        actionHandler?(sender.type)
    }

    // MARK: - Private properties

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    deinit {
        print("\(self.nameOfClass) deinit")
    }
}
