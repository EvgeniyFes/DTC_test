//
//  APIProvider.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Moya

enum APIProvider {
    case getGraphPoints(count: Int)
}

extension APIProvider: TargetType {

    public var baseURL: URL {
        return URL(string: APIConfig.serverURL)!
    }

    public var path: String {
        switch self {
        case .getGraphPoints:   return "/pointsList"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getGraphPoints:   return .post
        default:                return .get
        }
    }

    public var parameters: [String: Any]? {
        var parameters = [String: Any]()

        switch self {
        case .getGraphPoints(let count):
            parameters[ParameterKey.count] = count
        }

        parameters[ParameterKey.version] = APIConfig.version
        return parameters
    }

    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    public var headers: [String : String]? {
        switch self {
        case .getGraphPoints:
            return ["Content-Type": "application/json; charset=UTF-8"]

        default:    return nil
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .requestPlain
    }
}
