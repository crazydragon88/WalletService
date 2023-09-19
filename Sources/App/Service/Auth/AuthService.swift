//
// Created by Ken on 23/08/2023.
//

import Vapor
import Fluent

struct AuthService {
    let authServiceURL: String

    init() throws {
        guard let url = Environment.get("AUTH_SERVICE"), let port = Environment.get("AUTH_SERVICE_PORT"),
              let version = Environment.get("AUTH_SERVICE_VERSION") else {
            throw Abort(.badGateway)
        }
        authServiceURL = "http://\(url):\(port)\(version)"
    }

    func auth(req: Request) async throws -> Five88.UserToken {
        guard let authEndpoint = Environment.get("AUTH_SERVICE_AUTH") else {
            throw Abort(.badRequest)
        }

        let authResponse = try await req.client.post(URI(string: authServiceURL + authEndpoint)) { request in
            request.headers = req.headers
        }

        req.logger.info("Auth \(authResponse)")

        switch authResponse.status {

        case .ok:
            return try authResponse.content.decode(Five88.UserToken.self)

        case .unauthorized:
            throw Abort(.unauthorized)

        default:
            throw Error.problem
        }
    }
}
