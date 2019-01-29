//
//  Dependencies.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

class Dependencies {

    static let sharedDependencies = Dependencies()
    
    let provider: MoyaProvider<APIProvider>

    private init() {
        provider = MoyaProvider<APIProvider>()
    }

}
