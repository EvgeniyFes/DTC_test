//
//  ButtonExtension.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

extension UIButton {

    func applyEnterPointsCountDesign() {
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .enterCodeButtonFont()

        self.clipsToBounds = true

        self.backgroundColor = .blue
        self.layer.cornerRadius = 5.0
    }
}
