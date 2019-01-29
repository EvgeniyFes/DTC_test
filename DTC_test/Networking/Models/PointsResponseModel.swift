//
//  PointsResponseModel.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

struct PointsResponseModel: Decodable {
    let result: Int
    let response: PointsResponse
}

extension PointsResponseModel {

    enum ResultStatucCode: Int {
        case success        = 0
        case invalidParam   = -100
        case otherError     = -1
    }

    enum StructKeys: String, CodingKey {
        case result
        case response
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)
        let result: Int = (try? container.decode(Int.self, forKey: .result)) ?? -1
        var response: PointsResponse = (try? container.decode(PointsResponse.self, forKey: .response)) ?? PointsResponse(points: nil, message: nil)

        let message: String
        switch result {
        case ResultStatucCode.success.rawValue:
            message = ""
            
        case ResultStatucCode.invalidParam.rawValue:
            message = "Response.Error.InvalidateParam".localized

        case ResultStatucCode.otherError.rawValue:
            message = response.message ?? "Response.Error.Title".localized

        default:
            message = "Response.Error.Title".localized
        }

        response.message = message
        self.init(result: result, response: response)
    }
}

struct PointsResponse: Decodable {
    let points: [PointModel]?
    var message: String?
}
