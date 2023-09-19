//
// Created by Ken on 19/09/2023.
//

import Vapor

extension AuthService {
    enum Error {
        case problem
    }
}

extension AuthService.Error: AbortError {
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
