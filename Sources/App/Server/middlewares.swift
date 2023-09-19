//
// Created by Ken on 22/08/2023.
//

import Vapor

func middlewares(_ app: Application) throws {
    // uncomment to serve files from /Public folder
//     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
}
