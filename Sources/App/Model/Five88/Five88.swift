//
// Created by Ken on 23/08/2023.
//

import Vapor
import Fluent

struct Five88 {
    struct APIResponse<Data: Content>: Content {
        let status: String
        let code: Int
        let message: String
        let data: Data?
    }

    struct UserToken: Content, Codable {
        let _id: String
        let id: Int
        let uuid: String
        let token: String
        let expired: Date
        let username: String

        enum CodingKeys: String, CodingKey {
            case id
            case _id
            case username
            case expired = "expried"
            case token
            case uuid
        }
    }

    struct Wallet: Content, Codable {
        let balance: Double
        let id: Int

        enum CodingKeys: String, CodingKey {
            case id = "user_id"
            case balance
        }
    }
}
