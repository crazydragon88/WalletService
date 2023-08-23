//
// Created by Ken on 22/08/2023.
//

import Vapor

func server(_ app: Application) {
    if let hostname = Environment.get("HOSTNAME") {
        app.http.server.configuration.hostname = hostname
    }

    app.http.server.configuration.port = Int(Environment.get("PORT") ?? "") ?? 8080
}
