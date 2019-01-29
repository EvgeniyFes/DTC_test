//
//  BaseViewController.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import NVActivityIndicatorView

class BaseViewController: UIViewController {

    private var activityView = NVActivityIndicatorView.init(frame: CGRect(origin: .zero, size: CGSize(width: 40.0, height: 40.0)),
                                                            type: .lineSpinFadeLoader,
                                                            color: .black,
                                                            padding: 1.5)

    func showWaitingScreen() {
        if let parentView = activityView.superview {
            view.addSubview(activityView)
            activityView.translatesAutoresizingMaskIntoConstraints = false
            activityView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(parentView.snp.centerX)
                make.centerY.equalTo(parentView.snp.centerY)
            }
        }

        activityView.startAnimating()
    }

    func hideWaitingScreen() {
        activityView.stopAnimating()
    }

    func showAlertError(title: String? = "Error.Title".localized, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK.Button.Title".localized, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
