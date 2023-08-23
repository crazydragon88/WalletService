//
// Created by Ken on 23/08/2023.
//

import Vapor

struct AppController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        try routes.group("v1") { packages in
            try packages.register(collection: WalletController())
        }
    }
}
