//
//  Constants.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

enum Constants {
    static let navigationViewHeight: CGFloat = 60.0
    static let navigationViewTopOffsetValue: CGFloat = 20.0
    static let navigationViewTopOffsetiPhoneXValue: CGFloat = 44.0
}

// MARK: - API Config

enum APIConfig {
    static let serverURL = "https://demo.bankplus.ru/mobws/json"
    static let version = "1.1"
}

// MARK: - Server Parameter Name

enum ParameterKey {
    static let count = "count"
    static let version = "version"
}
