//
// Created by Ken on 23/08/2023.
//

import Vapor

struct WalletController: RouteCollection {

    let authService: AuthService
    let walletService: WalletService

    init() throws {
        authService = try AuthService()
        walletService = WalletService()
    }

    func boot(routes: RoutesBuilder) throws {
        let wallet = routes.grouped("wallet")

        wallet.get("balance", use: getBalance)
    }

    func getBalance(req: Request) async throws -> Wallet {
        let userTokenFive88 = try await authService.auth(req: req)
        return try await walletService.getBalanceFive88(userTokenFive88: userTokenFive88, req: req)
    }
}
