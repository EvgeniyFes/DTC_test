//
//  NavigationButtonType.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 27/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

enum NavigationButtonType: Int {
    case back
    case save
    case none

    func image() -> UIImage {
        switch self {
        case .back:     return #imageLiteral(resourceName: "icBack")
        case .save:     return #imageLiteral(resourceName: "icDownload")
        case .none:     return UIImage()
        }
    }
}

class NavigationButton: UIButton {

    private (set) var type: NavigationButtonType = .none

    func updateType(_ type: NavigationButtonType) {
        self.type = type
        let image = type.image().withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: .normal)
        self.tintColor = .black
    }
}
