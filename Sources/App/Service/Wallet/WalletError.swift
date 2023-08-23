//
// Created by Ken on 23/08/2023.
//

import Vapor

extension WalletService {
    enum Error {
        case problem
    }
}

extension WalletService.Error: AbortError {
    var reason: String {
        switch self {
        case .problem:
            return "Có lỗi xảy ra!"
        }
    }

    var status: HTTPStatus {
        switch self {
        case .problem:
            return .badRequest
        }
    }
}
