//
//  BaseView.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol NibInitializable {
    var view: UIView! {get set}
}

extension NibInitializable where Self: BaseView {

    func nibSetup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
}

class BaseView: UIView, NibInitializable {

    var view: UIView! {
        didSet {
            configureUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    func configureUI() {}
}
