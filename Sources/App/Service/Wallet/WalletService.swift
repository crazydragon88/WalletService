//
// Created by Ken on 23/08/2023.
//

import Vapor
import Fluent

struct WalletService {

    func getBalanceFive88(userTokenFive88: Five88.UserToken, req: Request) async throws -> Wallet {
        guard let url = Environment.get("WALLET_URL"), let endpoint = Environment.get("BALANCE") else {
            throw Abort(.badGateway)
        }

        let response = try await req.client.get(URI(string: url + endpoint + String(userTokenFive88.id)))
        req.logger.info("Get Five88 Balance: \n \(response)")
        let apiResponse = try response.content.decode(Five88.APIResponse<[Five88.Wallet]>.self)

        switch apiResponse.code {
            case 200:
                if let data = apiResponse.data, data.count > 0 {
                    let wallet = data[0]
                    return Wallet(wallet)
                }

                throw Error.problem

            default:
                throw Error.problem
        }
    }
}
