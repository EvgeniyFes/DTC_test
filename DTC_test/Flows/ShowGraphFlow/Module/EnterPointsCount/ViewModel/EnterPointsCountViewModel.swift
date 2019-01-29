//
//  EnterPointsCountViewModel.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

class EnterPointsCountViewModel {

    // MARK: - Private properties

    private var model: PointsFlowModelProtocol = PointsFlowModel()
    private let disposeBag = DisposeBag()
    private let provider: MoyaProvider<APIProvider>

    private var count: Int = 0

    // MARK: - Initialization

    init(provider: MoyaProvider<APIProvider>) {
        self.provider = provider
    }

    func updateCount(with value: String?) {
        count = Int(value ?? "0") ?? 0
    }

    // MARK: - Private methods

    private func validation() -> String? {
        if count > 0 {
            return nil
        }
        return "EnterPointsCountViewController.InvalidCount".localized
    }

    // MARK: - Request

    func sendRequest(with completionBlock: EnterPointsCountBlock?) {
        if let error = validation() {
            completionBlock?(nil, error)
            return
        }

        let pointsObservableRequest: Observable<PoinsRequestResult> = pointsObservable(for: count)
        pointsObservableRequest.subscribe(onNext: { [weak self] (result) in
            switch result {
            case .success(let points):
                self?.model.updatePoints(points)
                completionBlock?(self?.model, nil)
            case .failure(let message):
                completionBlock?(nil, message)
            }
            }, onError: { (error) in
                completionBlock?(nil, error.localizedDescription)
        }).disposed(by: disposeBag)
    }

    private func pointsObservable(for count: Int) -> Observable<PoinsRequestResult> {
        return provider.rx.request(.getGraphPoints(count: count))
            .retry(3)
            .map(PointsResponseModel.self, using: JSONDecoder(), failsOnEmptyData: true)
            .map { resultModel in
                if let points = resultModel.response.points {
                    return PoinsRequestResult.success(points: points)
                }
                let message = resultModel.response.message ?? "Response.Error.Title".localized
                return PoinsRequestResult.failure(message: message)
            }
            .asObservable()
    }
}
