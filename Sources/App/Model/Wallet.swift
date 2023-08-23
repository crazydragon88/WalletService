//
// Created by Ken on 23/08/2023.
//

import Vapor
import Fluent

struct Wallet: Content, Codable {
    let balance: Double

    struct Response: Content, Codable {
        let balance: Double
    }

    init(_ balanceFive88: Five88.Wallet) {
        balance = balanceFive88.balance
    }
}
