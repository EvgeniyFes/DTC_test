//
//  LanguageController.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

final class LanguageController {

    static let sharedInstance = LanguageController()

    func localizedString(for key: String?) -> String {
        guard let key = key else { return "" }
        if key == "" { return "" }

        return NSLocalizedString(key, comment: "")
    }
}

extension String {

    var localized: String {
        return LanguageController.sharedInstance.localizedString(for: self)
    }

}
